if (ato_da_cena == 0 && global.dialogo == false) {
    global.dialogo = true; 
    ato_da_cena = 1;      
    audio_play_sound(snd_arbusto, 1, false);
	audio_play_sound(snd_furacao, 1, false);
    instance_create_depth(134, 40, -9999, oSaciLouco);
}