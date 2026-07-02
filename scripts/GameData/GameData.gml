global.actionLibrary = 
{
    attack : 
    {
        name : "Ataque",
        description : "{0} ataca!",
        subMenu : -1,
        targetRequired : true,
        targetEnemyByDefault : true,
        targetAll : MODE.NEVER,
        userAnimation : "attack",
        effectSprite : sCurupiraLouco,
        effectOnTarget : MODE.ALWAYS,
        func : function(_user, _targets)
        {
            var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
            
           
            if (variable_instance_exists(_targets[0], "isDefending") && _targets[0].isDefending == true) 
            {
                _damage = ceil(_damage / 4); 
            }

            BattleChangeHP(_targets[0], -_damage, 0);
        }
    }, 

    defend : 
    {
        name : "Defender",
        description : "{0} fica em posição de defesa!",
        subMenu : -1,
        targetRequired : false, 
        targetEnemyByDefault : false,
        targetAll : MODE.NEVER,
        userAnimation : "defend", 
        effectSprite : -1, 
        effectOnTarget : MODE.NEVER,
        func : function(_user, _targets)
        {
            _user.isDefending = true; 
        }
    },
	
	usar_fruta : 
    {
        name : "Fruta",
        description : "{0} come uma Fruta e cura vida!",
        subMenu : -1,
        targetRequired : false,
        targetEnemyByDefault : false,
        targetAll : MODE.NEVER,
        userAnimation : "defend",
        effectSprite : -1,
        effectOnTarget : MODE.NEVER,
        func : function(_user, _targets)
        {
            if (InventorySearch(0) != -1) { 
                InventoryRemove(0); 
                BattleChangeHP(_user, 40, 0); 
            } else {
                BattleChangeHP(_user, 0, 0); 
            }
        }
    },

    usar_garrafa : 
    {
        name : "Usar Garrafa",
        description : "{0} tenta usar a Garrafa no inimigo!",
        subMenu : -1,
        targetRequired : true,
        targetEnemyByDefault : true,
        targetAll : MODE.NEVER,
        userAnimation : "prender",
        effectSprite : sSaciLouco,
        effectOnTarget : MODE.ALWAYS,
        func : function(_user, _targets)
        {
            if (InventorySearch(1) != -1) { 
                if (_targets[0].name == "Saci") { 
                    
                    var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
                    if (variable_instance_exists(_targets[0], "isDefending") && _targets[0].isDefending == true) {
                        _damage = ceil(_damage / 2); 
                    }
                    BattleChangeHP(_targets[0], -_damage, 0);
                    
                } else {
                    BattleChangeHP(_targets[0], 0, 0); 
                }
            } else {
                BattleChangeHP(_targets[0], 0, 0); 
            }
        }
    },
    
    usar_cipo : 
    {
        name : "Amarrar Cipó",
        description : "{0} tenta amarrar com o Cipó!",
        subMenu : -1,
        targetRequired : true,
        targetEnemyByDefault : true,
        targetAll : MODE.NEVER,
        userAnimation : "prender",
        effectSprite : sCurupiraLouco, 
        effectOnTarget : MODE.ALWAYS,
        func : function(_user, _targets)
        {
            if (InventorySearch(2) != -1) { 
                if (_targets[0].name == "Curupira") { 
                
                    var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
                    if (variable_instance_exists(_targets[0], "isDefending") && _targets[0].isDefending == true) {
                        _damage = ceil(_damage / 2); 
                    }
                    BattleChangeHP(_targets[0], -_damage, 0);
                    
                } else {
                    BattleChangeHP(_targets[0], 0, 0); 
                }
            } else {
                BattleChangeHP(_targets[0], 0, 0); 
            }
        }
    }
	
} 

enum MODE
{
    NEVER = 0,
    ALWAYS = 1,
    VARIES = 2
}

global.party=
	[
		{
			name: "Iara",
			hp: 100,
			hpMax: 100,
			strength: 6,
			sprites: {idle: Iara_ParadaL, prender: Iara_ParadaL , defend: Iara_ParadaL , down: Iara_ParadaL },
			actions : [global.actionLibrary.defend, global.actionLibrary.usar_fruta, global.actionLibrary.usar_garrafa, global.actionLibrary.usar_cipo]
		}
	];
	
global.enemies=
	{
		Curupira: {
			name: "Curupira",
			hp: 100,
			hpMax: 100,
			strength: 10,
			sprites: {idle: sCurupiraLouco, attack: sCurupiraLouco },
			actions : [global.actionLibrary.attack],
			AIscript : function()
			{
				var _action = actions[0];
				var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index)
				{
					return (_unit.hp > 0);
				});
				var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
				return [_action, _target];
			}
		},
		
		 Saci: {
			name: "Saci",
			hp: 100,
			hpMax: 100,
			strength: 10,
			sprites: {idle: sSaciLouco, attack: sSaciLouco },
			actions : [global.actionLibrary.attack],
			AIscript : function()
			{
				var _action = actions[0];
				var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index)
				{
					return (_unit.hp > 0);
				});
				var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
				return [_action, _target];
			}
		},
		
		Cuca: {
			name: "Cuca",
			hp: 150,
			hpMax: 150,
			strength: 10,
			sprites: {idle: sCucaLouca, attack: sCucaLouca },
			actions : [global.actionLibrary.attack],
			AIscript : function()
			{
				var _action = actions[0];
				var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index)
				{
					return (_unit.hp > 0);
				});
				var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
				return [_action, _target];
			}
		}
		
	}