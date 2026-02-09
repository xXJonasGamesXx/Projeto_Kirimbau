if keyboard_check(vk_up)
{
	y-=1
}
if keyboard_check(vk_down)
{
	y+=1
}
if keyboard_check(vk_left)
{
	x-=1 image_xscale=-1
}
if keyboard_check(vk_right)
{
	x+=1 image_xscale=1
}

if (keyboard_check(vk_right) || keyboard_check(vk_left)) 
{
	sprite_index=Iara_Andando
}
else
{
	sprite_index=Iara_Parada
}