/// @description
if vsp < 20
	vsp += grav;
y += vsp;

if y >= ystart && grav > 0
{
	y = ystart;
	if !grounded
	{
		if !(instance_exists(obj_manual) && obj_manual.open) && !instance_exists(obj_option)
		{
			scr_soundeffect(sfx_breakblock2)
			with obj_camera
			{
				shake_mag = 5;
				shake_mag_acc = 5 / room_speed;
			}
		}
		
		grounded = true;
		vsp = -6;
		repeat 8
			instance_create(irandom_range(bbox_left, bbox_right), bbox_bottom, obj_debris);
		
		if object_index == obj_title
		{
			with obj_player
			{
				state = states.actor;
				sprite_index = spr_bossintro;
				image_index = 0;
				image_speed = 0.35;
				vsp = -4;
			}
		}
	}
	else
	{
		grav = 0;
		vsp = 0;
	}
}
with obj_player
{
	if sprite_index == spr_bossintro && image_index >= image_number - 1
	{
		state = states.normal;
		sprite_index = spr_idle;
		image_index = 0;
	}
}

// background
if object_index == obj_title
{
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_index(back_id, sel);
}
