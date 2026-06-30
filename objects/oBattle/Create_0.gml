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
	enemyUnits[i] = instance_create_depth(x+250+(i*10), y+68+(i*20), depth-10, oBattleUnitEnemy, enemies[i]);
	array_push(units, enemyUnits[i]);
}

for (var i = 0; i < array_length(global.party); i++)
{
	partyUnits[i] = instance_create_depth(x+70+(i*10), y+68+(i*15), depth-10, oBattleUnitPc, global.party[i]);
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
	battleText = string_ext(_action.description, [_user.name])
    if (!is_array(currentTargets)) currentTargets = [currentTargets];
    battleWaitTimeRemaining = battleWaitTimeFrames;
    with (_user)
    {
        acting = true;
        if (!is_undefined(_action[$ "userAnimation"])) && (!is_undefined(_user.sprites[$ _action.userAnimation]))
        {
            sprite_index = sprites[$ _action.userAnimation];
            image_index = 0;
        }
    }
    battleState = BattleStatePerformAction;
}

function BattleStatePerformAction()
{
    if (currentUser.acting)
    {
        if (currentUser.image_index >= currentUser.image_number -1)
        {
            with (currentUser)
            {
                sprite_index = sprites.idle;
                image_index = 0;
                acting = false;
            }

            if (variable_struct_exists(currentAction, "effectSprite"))
            {
                if (currentAction.effectOnTarget == MODE.ALWAYS) || ( (currentAction.effectOnTarget == MODE.VARIES) && (array_length(currentTargets) <= 1) )
                {
                    for (var i = 0; i < array_length(currentTargets); i++)
                    {
                        instance_create_depth(currentTargets[i].x, currentTargets[i].y, currentTargets[i].depth-1, oBattleEffect, {sprite_index : currentAction.effectSprite});
                    }
                }
                else //play it at 0,0
                {
                    var _effectSprite = currentAction.effectSprite
                    if (variable_struct_exists(currentAction, "effectSpriteNoTarget")) _effectSprite = currentAction.effectSpriteNoTarget;
                    instance_create_depth(x, y, depth-100, oBattleEffect, {sprite_index : _effectSprite});
                }
            }
            currentAction.func(currentUser, currentTargets);
        }
    }
    else 
    {
        if (!instance_exists(oBattleEffect))
        {
            battleWaitTimeRemaining--
            if (battleWaitTimeRemaining == 0)
            {
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
    } // Aqui fecha apenas o 'if (_partyDead)'!
    
    var _enemiesDead = true;
    for (var i = 0; i < array_length(enemyUnits); i++) {
        if (enemyUnits[i].hp > 0) _enemiesDead = false; 
    }
    
   if (_enemiesDead) {
        instance_activate_all();
        
        // 1. Troca o Monstro no mapa
        if (creator != noone && instance_exists(creator)) {
            with (creator) {
                var _novoObj = noone;
                switch (object_index) {
                    case oCurupiraLouco: _novoObj = oCurupiraDerrotado; break;
                    case oSaciLouco:     _novoObj = oSaciDerrotado;     break;
                    case oCucaLouca:     _novoObj = oCucaDerrotada;     break;
                }
                if (_novoObj != noone) {
                    instance_create_layer(x, y, "Instances", _novoObj);
                }
                instance_destroy(); 
            }
        }
        
        pos_vitoria = true; 
        
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

