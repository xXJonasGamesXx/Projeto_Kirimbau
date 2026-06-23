var _tela_largura = display_get_gui_width();
var _tela_altura = display_get_gui_height();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_batalha); 

// Título (Aumentado 3x)
draw_set_color(c_red);
draw_text_transformed(_tela_largura / 2, _tela_altura / 2 - 80, "GAME OVER", 3, 3, 0);

// Opção 1: Continuar (Aumentado 2x)
if (opcao_selecionada == 0) draw_set_color(c_yellow); else draw_set_color(c_white);
draw_text_transformed(_tela_largura / 2, _tela_altura / 2 + 10, "Continuar do Save", 2, 2, 0);

// Opção 2: Tela Inicial (Aumentado 2x)
if (opcao_selecionada == 1) draw_set_color(c_yellow); else draw_set_color(c_white);
draw_text_transformed(_tela_largura / 2, _tela_altura / 2 + 60, "Tela Inicial", 2, 2, 0);