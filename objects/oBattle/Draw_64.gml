draw_sprite(battleBackground, 0, x, y);

var _unitWithCurrentTurn = unitTurnOrder[turn].id;
for (var i = 0; i < array_length(unitRenderOrder); i++)
{
	with (unitRenderOrder[i])
	{
		draw_self();
	}
}

draw_sprite_stretched(sBox, 0, x+75, y+120, 245, 60);
draw_sprite_stretched(sBox, 0, x, y+120, 245, 60);

#macro COLLUMN_ENEMY 15
#macro COLLUMN_NAME 90
#macro COLLUMN_HP 160

draw_set_font(fnt_dialogo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_gray);
draw_text(x+COLLUMN_ENEMY, y+120, "INIMIGO");
draw_text(x+COLLUMN_NAME, y+120, "NOME");
draw_text(x+COLLUMN_HP, y+120, "HP");