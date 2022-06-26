with (other)
{
    if (vsp < 0)
    {
        repeat (2)
            create_debris(x, (y + 43), spr_cheesechunk)
        vsp *= 0.5
        audio_stop_sound(sfx_cheesejump)
        audio_stop_sound(sfx_jump)
        scr_soundeffect(sfx_cheesejump)
    }
    if (state == (37 << 0))
        state = (grounded ? (0 << 0) : (92 << 0))
    if (hsp != 0 && (floor(image_index) % 4) == 0)
    {
        create_debris(x, (y + 43), spr_cheesechunk)
        if (!other.stepped)
        {
            scr_soundeffect(sfx_cheesefloor)
            other.stepped = 1
            other.alarm[0] = 8
        }
    }
}
