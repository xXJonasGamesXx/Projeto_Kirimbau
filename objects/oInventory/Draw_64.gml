if (show_inventory)
{
    var _screen_w = display_get_gui_width();
    var _screen_h = display_get_gui_height();
    
    var _inv_width = _screen_w * 0.54;
    var _inv_height = _screen_h * 0.6;
    
    var _gui_x = (_screen_w - _inv_width) / 2;
    var _gui_y = (_screen_h - _inv_height) / 2;

    var _slot_size = 54;

    draw_sprite_stretched(sInventory, 0, _gui_x, _gui_y, _inv_width, _inv_height);

    var _rows = ceil(INVENTORY_SLOTS / rowLength);
    var _grid_w = rowLength * _slot_size;
    var _grid_h = _rows * _slot_size;
    
    var _margin_x = (_inv_width - _grid_w) / 2;
    var _margin_y = (_inv_height - _grid_h) / 2;

    for (var i = 0; i < INVENTORY_SLOTS; i += 1)
    {
        var xx = _gui_x + _margin_x + (i mod rowLength) * _slot_size;
        var yy = _gui_y + _margin_y + (i div rowLength) * _slot_size;
        
        draw_sprite_stretched(sSlot, 0, xx, yy, _slot_size, _slot_size);
        
        if (global.inventory[i] != -1)
        {
            draw_sprite_stretched(sFruta, global.inventory[i], xx, yy, _slot_size, _slot_size);
        }
    }
}