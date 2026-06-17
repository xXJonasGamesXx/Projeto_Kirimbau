global.actionLibrary = 
{
    attack : 
    {
        name : "Attack",
        description : "{0} attacks!",
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
			sprites: {idle: Iara_ParadaL, attack: Iara_ParadaL , defend: Iara_ParadaL , down: Iara_ParadaL },
			actions : [global.actionLibrary.attack]
		}
	];
	
global.enemies=
	{
		Curupira: {
			name: "Curupira",
			hp: 150,
			hpMax: 150,
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
		}
	}