if (texto_formatado == false) {
    texto_formatado = true;
    
    var _texto_original = string(text);
    var _numero_limpo = string_digits(_texto_original);
    
    if (_numero_limpo != "") {
        if (string_char_at(_texto_original, 1) == "-") {
            
            var _inimigo = instance_nearest(x, ystart, oBattleUnitEnemy);
            if (_inimigo != noone && point_distance(x, ystart, _inimigo.x, _inimigo.y) < 50) {
                text = _numero_limpo + "% Contido!";
                col = c_aqua; 
            } else {
                text = "-" + _numero_limpo;
                col = c_red;
            }
            
        } 
        else {
            text = "+" + _numero_limpo;
            col = c_green;
        }
    }
}

image_alpha -= 0.02;
if (vspeed < 0) image_alpha = 1.0;
if (y > ystart) vspeed = 0;
if (image_alpha <= 0) instance_destroy();