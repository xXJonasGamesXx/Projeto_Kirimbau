keyboard_clear(ord("E"));
io_clear();

instance_deactivate_all(true);

units = [];
turn = 0;
unitTurnOrder = [];
unitRenderOrder = [];
battleText = "";
turnCount = 0;
roundCount = 0;
battleWaitTimeFrames = 30;
battleWaitTimeRemaining = 0;
currentUser = noone;
currentAction = -1;
currentTargets = noone;

for (var i = 0; i < array_length(enemies); i++)
{
    enemyUnits[i] = instance_create_depth(x+160+(i*10), y+60+(i*20), depth-10, oBattleUnitEnemy, enemies[i]);
    array_push(units, enemyUnits[i]);
}

for (var i = 0; i < array_length(global.party); i++)
{
    var _iara_inst = instance_create_depth(x + 260, y + 175, depth-10, oBattleUnitPc, global.party[i]);
    
    _iara_inst.image_xscale = -0.17; 
    _iara_inst.image_yscale = 0.17;
    
    partyUnits[i] = _iara_inst;
    array_push(units, partyUnits[i]);
}

unitTurnOrder = array_shuffle(units);

RefreshRenderOrder = function()
{
	unitRenderOrder = [];
	array_copy(unitRenderOrder, 0, units, 0, array_length(units)); 
	array_sort(unitRenderOrder, function(_1, _2)
	{
		return _1.y - _2.y;
	});
}
RefreshRenderOrder();

function BattleStateSelectAction()
{
	if(!instance_exists(oMenu))
	{
	    var _unit = unitTurnOrder[turn];

	    if (!instance_exists(_unit)) || (_unit.hp <= 0)
	    {
	        battleState = BattleStateVictoryCheck;
	        exit;
	    }

	    if (_unit.object_index == oBattleUnitPc)
		{
		
		var _menuOptions = [];
		var _subMenus = {};

		var _actionList = _unit.actions;

		for (var i = 0; i < array_length(_actionList); i++)
		{
			var _action = _actionList[i];
			var _available = true; 
			var _nameAndCount = _action.name; 
			if (_action.subMenu == -1)
			{
				array_push(_menuOptions, [_nameAndCount, MenuSelectAction, [_unit, _action], _available]);
			}
			else
			{
				if (is_undefined(_subMenus[$ _action.subMenu]))
				{
					variable_struct_set(_subMenus, _action.subMenu, [[_nameAndCount, MenuSelectAction, [_unit, _action], _available]]);
				}
				else
				{
					array_push(_subMenus[$ _action.subMenu], [_nameAndCount, MenuSelectAction, [_unit, _action], _available]);
				}
			}
		}
		
		var _subMenusArray = variable_struct_get_names(_subMenus);
		for (var i = 0; i < array_length(_subMenusArray); i++)
		{
	
			array_push(_subMenus[$ _subMenusArray[i]], ["Back", MenuGoBack, -1, true]);
			array_push(_menuOptions, [_subMenusArray[i], SubMenu, [_subMenus[$ _subMenusArray[i]]], true]);
		}

		Menu(x+10, y+110, _menuOptions, , 74, 60);
		
		}
		else
		{
			var _enemyAction = _unit.AIscript();
			if (_enemyAction != -1) BeginAction(_unit.id, _enemyAction[0], _enemyAction[1]);
		}
	}
}

function BeginAction(_user, _action, _targets)
{
    currentUser = _user;
    currentAction = _action;
    currentTargets = _targets;
    battleText = string_ext(_action.description, [_user.name]);
    if (!is_array(currentTargets)) currentTargets = [currentTargets];
    battleWaitTimeRemaining = battleWaitTimeFrames;
    
    with (_user)
    {
        acting = true;
        
        if (object_index == oBattleUnitPc) {
            
            if (variable_struct_exists(_action, "userAnimation")) {
                if (_action.userAnimation == "defend") {
                    sprite_index = sIconIaraDefesa; 
                } else if (_action.userAnimation == "prender") {
                    sprite_index = sIconIaraForca;  
                }
            }
            
        } 
        else {
            if (!is_undefined(_action[$ "userAnimation"])) {
                var _animName = _action.userAnimation;
                if (variable_struct_exists(sprites, _animName)) {
                    sprite_index = sprites[$ _animName];
                }
            }
        }
        
        image_index = 0;
    }
    
    battleState = BattleStatePerformAction;
}

function BattleStatePerformAction()
{
    if (currentUser.acting)
    {
        if (currentUser.image_index >= currentUser.image_number - 1)
        {
            with (currentUser)
            {
                if (object_index != oBattleUnitPc) {
                    sprite_index = sprites.idle;
                }
                
                image_index = 0;
                acting = false;
            }

            if (variable_struct_exists(currentAction, "effectSprite") && currentAction.effectSprite != -1)
            {
                if (currentAction.effectOnTarget == MODE.ALWAYS) || ( (currentAction.effectOnTarget == MODE.VARIES) && (array_length(currentTargets) <= 1) )
                {
                    for (var i = 0; i < array_length(currentTargets); i++)
                    {
                        var _alvo = currentTargets[i];
                        
                        var _centro_x = _alvo.bbox_left + (_alvo.bbox_right - _alvo.bbox_left) / 2;
                        var _centro_y = _alvo.bbox_top + (_alvo.bbox_bottom - _alvo.bbox_top) / 2;
                        
                        instance_create_depth(_centro_x, _centro_y, _alvo.depth-1, oBattleEffect, {sprite_index : currentAction.effectSprite});
                    }
                }
                else 
                {
                    var _effectSprite = currentAction.effectSprite
                    if (variable_struct_exists(currentAction, "effectSpriteNoTarget")) _effectSprite = currentAction.effectSpriteNoTarget;
                    
                    instance_create_depth(x + 158, y + 89, depth-100, oBattleEffect, {sprite_index : _effectSprite});
                }
            }
            currentAction.func(currentUser, currentTargets);
        }
    }
    else 
    {
        if (!instance_exists(oBattleEffect))
        {
            battleWaitTimeRemaining--;
            
            if (battleWaitTimeRemaining <= 0)
            {
                with (currentUser) {
                    if (object_index == oBattleUnitPc) {
                        sprite_index = sIconIara;
                    }
                }
                
                battleState = BattleStateVictoryCheck;
            }
        }
    }
}

function BattleStateVictoryCheck()
{
    var _partyDead = true;
    for (var i = 0; i < array_length(partyUnits); i++) {
        if (partyUnits[i].hp > 0) _partyDead = false; 
    }
    
    if (_partyDead) {
        instance_activate_all(); 
        room_goto(rm_gameover); 
        return; 
    } 
    
    var _enemiesDead = true;
    for (var i = 0; i < array_length(enemyUnits); i++) {
        if (enemyUnits[i].hp > 0) _enemiesDead = false; 
    }
    
   if (_enemiesDead) {
        instance_activate_all();
        
        if (creator != noone && instance_exists(creator)) {
            with (creator) {
                var _novoObj = noone;
                var _nomeNpc = ""; 
                
               switch (object_index) {
                    case oCurupiraLouco: 
                        _novoObj = oCurupiraDerrotado; 
                        _nomeNpc = "CurupiraDerrotado";
                        global.curupira_derrotado = true; 
                        break;
                    case oSaciLouco:     
                        _novoObj = oSaciDerrotado;     
                        _nomeNpc = "SaciDerrotado"; 
                        global.saci_derrotado = true; 
                        break;
                    case oCucaLouca:     
                        _novoObj = oCucaDerrotada;     
                        _nomeNpc = "CucaDerrotada"; 
                        global.cuca_derrotada = true; 
                        break;
                }
                
                if (_novoObj != noone) {
                    var _inst = instance_create_layer(x, y, "Instances", _novoObj);
                    _inst.npc_nome = _nomeNpc; 
                    
                    var _dialogo = instance_create_depth(x, y, -9999, oDialogo);
                    _dialogo.npc_nome = _nomeNpc; 
                }
                instance_destroy(); 
            }
        }
        
        with (oBattleUnitPc) instance_destroy();
        with (oBattleUnitEnemy) instance_destroy();
        instance_destroy(); 
        
        return; 
    }
    
    battleState = BattleStateTurnProgression;
}

function BattleStateTurnProgression()
{
	battleText = "";
    turnCount++;
    turn++;
    if (turn > array_length(unitTurnOrder) - 1)
    {
        turn = 0;
        roundCount++;
    }
    battleState = BattleStateSelectAction;
}

battleState = BattleStateSelectAction;



if (layer_exists("Tiles_1")) {
    layer_set_visible("Tiles_1", false);
}

