var up = 0, down = 0, left = 0, right = 0;

if (global.dialogo == false) {
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
}

velh = (right - left) * max_vel;
velv = (down - up) * max_vel;


if (velh != 0 || velv != 0) 
{
    if (velh != 0) 
    {
        sprite_index = Iara_Andando;
        image_xscale = sign(velh);
    }
    else if (velv > 0) 
    {
        sprite_index = Iara_Descendo;
    }
    else if (velv < 0) 
    {
        sprite_index = Iara_Subindo;
    }
}
else 
{
    if (sprite_index == Iara_Subindo)  sprite_index = Iara_ParadaC;
    if (sprite_index == Iara_Descendo) sprite_index = Iara_ParadaF;
    if (sprite_index == Iara_Andando)  sprite_index = Iara_ParadaL;
}


if distance_to_object(oParNPC) <= 10 {
	if keyboard_check_pressed(ord("E")) and global.dialogo == false {
		var _npc = instance_nearest(x, y, oParNPC);
		
		if (variable_instance_exists(_npc, "nome")) {
		    var _dialogo = instance_create_layer(x, y, "Dialogo", oDialogo);
		    _dialogo.npc_nome = _npc.nome;
		}
	}
}

depth = -bbox_bottom;




