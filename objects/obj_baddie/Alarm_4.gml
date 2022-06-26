with (create_afterimage(x, y, sprite_index, 0))
    image_xscale = other.image_xscale
if (grounded == 1)
{
    with (instance_create(x, y, obj_dashcloud2))
        image_xscale = other.image_xscale
}
if (state == (125 << 0))
    alarm[4] = 5
