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
	
	prender : 
    {
        name : "Prender",
        description : "{0} tenta prender!",
        subMenu : -1,
        targetRequired : true,
        targetEnemyByDefault : true,
        targetAll : MODE.NEVER,
        userAnimation : "prender",
        effectSprite : sCurupiraLouco,
        effectOnTarget : MODE.ALWAYS,
        func : function(_user, _targets)
        {
            var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
            
           
            if (variable_instance_exists(_targets[0], "isDefending") && _targets[0].isDefending == true) 
            {
                _damage = ceil(_damage / 2); 
            }

            BattleChangeHP(_targets[0], -_damage, 0);
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
			actions : [global.actionLibrary.prender, global.actionLibrary.defend]
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