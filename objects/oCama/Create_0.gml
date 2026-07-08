dormindo = false;

if (!variable_global_exists("falou_com_pai")) {
    global.falou_com_pai = false;
}

animacao_rolando = false;

if (room == rm_Quarto && global.acordou_quarto == false) || (room == rm_floresta1 && global.acordou_floresta == false) {
    
	audio_play_sound(snd_sonho, 1, false);
    sprite_index = sDormindo; 
    image_speed = 1; 
    animacao_rolando = true;
    
    alarm[1] = 120; 
    
    if (instance_exists(oIara)) oIara.visible = false; 
}