if (keyboard_check_pressed(vk_space) && !instance_exists(obj_controlador)) {
	var _targetRoom = Tela_Inicial;
	
	if (room == Tela_Inicial ) _targetRoom = Quarto;
	
	fadeToRoom(_targetRoom, 60, c_black);
}