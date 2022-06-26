if (other.state == (186 << 0))
    exit;
if (sprite_index == spr_grabbiehand_fall && player == -4)
{
    with (other)
    {
        if (state == (33 << 0))
        {
            var i = 0
            var p = id
            repeat (4)
            {
                with (create_debris(x, y, spr_boxxeddebris))
                {
                    image_index = i
                    vsp = random_range(-10, -5)
                    hsp = ((-p.xscale) * random_range(4, 8))
                }
                i++
            }
            with (instance_create(x, y, obj_boxxeddebris))
                image_index = 0
            with (instance_create(x, y, obj_boxxeddebris))
                image_index = 1
            with (instance_create(x, y, obj_boxxeddebris))
                image_index = 2
            with (instance_create(x, y, obj_boxxeddebris))
                image_index = 3
            with (instance_create(x, y, obj_boxxeddebris))
                image_index = 4
        }
        if (state == (24 << 0) or state == (25 << 0))
        {
            repeat (8)
            {
                with (create_debris(x, y, spr_slimedebris))
                {
                    vsp = random_range(-5, 0)
                    hsp = random_range(-3, 3)
                }
            }
        }
    }
    accel = 0
    grav = 0
    vsp = 0
    grabbing = 1
    sprite_index = spr_grabbiehand_catch
    grab_xstart = x
    grab_ystart = y
    player = other.id
    other.image_index = 0
    other.sprite_index = spr_player_catched
    other.state = (106 << 0)
    other.x = x
    other.y = y
    other.vsp = 0
    other.hsp = 0
}
if (sprite_index == spr_grabbiehand_catch)
{
    if (player == -4)
        player = other.id
    other.vsp = 0
    other.hsp = 0
    other.state = (106 << 0)
    other.sprite_index = spr_player_catched
    other.x = x
    other.y = y
}
