draw_set_font(Font2);
draw_set_colour(c_black);

var dist = 55;
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height()();
var x1 = gui_largura/2;
var y1 = gui_altura/2;

for(var i = 0;i <op_max;i++){
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	if(index == i){
		draw_set_colour(c_white);
	}else{
		draw_set_colour(c_black);
	}
	
	draw_text(x1, y1 + (30 * i), opcoes[i]);
}

draw_set_font(-1)