if (room == rm_editor)
    exit;
if global.key_inv
    exit;
with (other)
{
    if (state != (51 << 0) && state != (186 << 0) && state != (16 << 0) && state != (47 << 0) && state != (21 << 0) && state != (33 << 0) && state != (24 << 0) && state != (48 << 0) && state != (38 << 0) && state != (107 << 0) && state != (49 << 0))
    {
        instance_destroy(other)
        global.key_inv = 1
        key_particles = 1
        alarm[7] = 30
        scr_soundeffect(sfx_collecttoppin)
        state = (90 << 0)
        image_index = 0
        global.heattime = 60
    }
}
