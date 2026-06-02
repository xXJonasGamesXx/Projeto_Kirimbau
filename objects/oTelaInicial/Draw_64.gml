var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();

var x_meio = gui_largura / 2;
var y_meio = gui_altura / 2;

var inicio_x = x_meio - 375;
var inicio_y = y_meio - 270;

draw_sprite(sTelaInicial, 0, inicio_x, inicio_y);

draw_set_font(fnt_telainicial);

for(var i = 0; i < op_max; i++){
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	if(index == i){
		draw_set_colour(c_white);
	}else{
		draw_set_colour(c_black);
	}
	
	draw_text(inicio_x + pos_x[i], inicio_y + pos_y[i], opcoes[i]);
}

draw_set_font(-1);