if keyboard_check(vk_up) && !place_meeting(x, y - 2, oParede)
{
    y -= 1;
    sprite_index = Iara_Subindo;
}
else if keyboard_check(vk_down) && !place_meeting(x, y + 2, oParede)
{
    y += 1;
    sprite_index = Iara_Descendo;
}
else if keyboard_check(vk_left) && !place_meeting(x - 2, y, oParede)
{
    x -= 1;
    image_xscale = -1; 
    sprite_index = Iara_Andando;
}
else if keyboard_check(vk_right) && !place_meeting(x + 2, y, oParede)
{
    x += 1;
    image_xscale = 1;
    sprite_index = Iara_Andando;
}

if (!keyboard_check(vk_up) && !keyboard_check(vk_down) && !keyboard_check(vk_left) && !keyboard_check(vk_right)) 
{
    if (sprite_index == Iara_Subindo)  sprite_index = Iara_ParadaC; 
    if (sprite_index == Iara_Descendo) sprite_index = Iara_ParadaF; 
    if (sprite_index == Iara_Andando)  sprite_index = Iara_ParadaL; 
}

