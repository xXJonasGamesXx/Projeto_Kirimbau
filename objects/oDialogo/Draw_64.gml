if inicializar == true {
    var _guil = display_get_gui_width();
    var _guia = display_get_gui_height();

    var _xx = 0;
    
    // Altura da caixa (mude esse 150 se quiser a caixa mais grossa ou mais fina)
    var _yy = _guia - 150; 
    
    var _c = c_black;
    var _sprite = texto_grid[# infos.Retrato, pagina];
    
    draw_set_font(fnt_dialogo);
    
    // Reseta os alinhamentos e cores
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_colour(c_white);

    if texto_grid[# infos.Lado, pagina] == 0 {
        // --- LADO ESQUERDO ---
        draw_rectangle_colour(_xx + 200, _yy, _guil, _guia, _c, _c, _c, _c, false);
        draw_text(_xx + 216, _yy - 32, texto_grid[# infos.Nome, pagina]);
        draw_text_ext(_xx + 232, _yy + 32, texto_grid[# infos.Texto, pagina], 32, _guil - 264);
        
        // Desenha o retrato suave (escala 0.5)
        gpu_set_texfilter(true);
        draw_sprite_ext(_sprite, 0, 100, _guia, 0.5, 0.5, 0, c_white, 1);
        gpu_set_texfilter(false);
        
    } else {
        // --- LADO DIREITO ---
        draw_rectangle_colour(_xx, _yy, _guil - 200, _guia, _c, _c, _c, _c, false);
        
        var _stgw = string_width(texto_grid[# infos.Nome, pagina]); 
        draw_text(_guil - 216 - _stgw, _yy - 32, texto_grid[# infos.Nome, pagina]);
        draw_text_ext(_xx + 32, _yy + 32, texto_grid[# infos.Texto, pagina], 32, _guil - 264);
        
        // Desenha o retrato espelhado (-0.5 no X) e suave
        gpu_set_texfilter(true);
        draw_sprite_ext(_sprite, 0, _guil - 100, _guia, -0.5, 0.5, 0, c_white, 1);
        gpu_set_texfilter(false);
    }
}