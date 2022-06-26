with (baddieID)
{
    if (alarm[5] != -1 or state == (80 << 0))
    {
        var p = (patroltimermax - patroltimer)
        if (state == (80 << 0))
            p++
        var t = ((p * 3) + other.patrolalert_index)
        draw_sprite(spr_patrolalert_number, t, x, (y - 100))
    }
}
