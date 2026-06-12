if (keyboard_check_pressed(vk_space) && !instance_exists(oFade)) {
	var _targetRoom = Quarto;
	
	if (room == Quarto ) _targetRoom = Tela_Inicial;
	
	fadeToRoom(_targetRoom, 120, c_black);
}