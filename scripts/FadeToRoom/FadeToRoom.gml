function FadeToRoom(_room, _dur, _color) {
    var _inst = instance_create_depth(0, 0, -99999, oFade);

    with(_inst) {
        targetRoom = _room;
        duration = _dur;
        color = _color;
        
        fade_speed = 1 / duration; 
    }
}