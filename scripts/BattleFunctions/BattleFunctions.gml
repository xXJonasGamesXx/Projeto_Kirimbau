function NewEncounter(_enemies, _bg, _encounter_creator = noone) {
    instance_deactivate_all(true); 
    
    var _camX = camera_get_view_x(view_camera[0]);
    var _camY = camera_get_view_y(view_camera[0]);

    instance_create_depth(_camX, _camY, -9999, oBattle, {
        enemies: _enemies,
        creator: _encounter_creator,
        battleBackground: _bg
    });
}

function BattleChangeHP(_target, _amount, _aliveDeadOrEither)
{
    var _failed = false;
    if (_aliveDeadOrEither == 0) && (_target.hp <= 0) _failed = true;
    if (_aliveDeadOrEither == 1) && (_target.hp > 0) _failed = true;

    var _col = c_white;
    var _text_to_show = "";

    if (!_failed)
    {
        _target.hp += _amount;
        _target.hp = clamp(_target.hp, 0, _target.hpMax);

        if (_amount < 0)
        { 
            if (_target.object_index != oBattleUnitPc) 
            { 
                _text_to_show = string(abs(_amount)) + "% Contido!";
                _col = c_aqua; 
            } 
            else 
            { 
                _text_to_show = string(_amount); 
                _col = c_red;
            }
        } 
        else if (_amount > 0) 
        { 
            _text_to_show = "+" + string(_amount);
            _col = c_green;
        } 
        else 
        { 
            _text_to_show = "0";
            _col = c_white;
        }
    }
    else 
    {
        _text_to_show = "Falhou";
        _col = c_gray;
    }

    if (_text_to_show != "")
    {
        var _inst = instance_create_depth(_target.x, _target.y, _target.depth - 1, oBattleFloatingText);
        _inst.text = _text_to_show;
        _inst.col = _col;
    }
}