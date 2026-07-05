if inicializar == true {
    var _guil = display_get_gui_width();
    var _guia = display_get_gui_height();

    var _xx = 0;
    
    var _altura_caixa = 150; 
    
    var _margem = 10; 
    
    var _yy = _guia - _altura_caixa - _margem; 
    
    var _sprite = texto_grid[# infos.Retrato, pagina];
    
    draw_set_font(fnt_dialogo);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_colour(c_white);

    if texto_grid[# infos.Lado, pagina] == 0 {
        
        draw_sprite_stretched(sChatBox, 0, _xx + 200, _yy, (_guil - 200) - _margem, _altura_caixa);
        
        draw_text(_xx + 216, _yy - 32, texto_grid[# infos.Nome, pagina]);
        
        draw_text_ext(_xx + 232, _yy + 32, texto_grid[# infos.Texto, pagina], 32, (_guil - 264) - _margem);
        
        gpu_set_texfilter(true);
        draw_sprite_ext(_sprite, 0, 100, _guia - _margem, 0.5, 0.5, 0, c_white, 1);
        gpu_set_texfilter(false);
        
    } else {
        
        draw_sprite_stretched(sChatBox, 0, _xx + _margem, _yy, (_guil - 200) - _margem, _altura_caixa);
        
        var _stgw = string_width(texto_grid[# infos.Nome, pagina]); 
        
        draw_text(_guil - 216 - _stgw - _margem, _yy - 32, texto_grid[# infos.Nome, pagina]);
        draw_text_ext(_xx + 32 + _margem, _yy + 32, texto_grid[# infos.Texto, pagina], 32, (_guil - 264) - _margem);
        
        gpu_set_texfilter(true);
        draw_sprite_ext(_sprite, 0, _guil - 100 - _margem, _guia - _margem, -0.5, 0.5, 0, c_white, 1);
        gpu_set_texfilter(false);
    }
}