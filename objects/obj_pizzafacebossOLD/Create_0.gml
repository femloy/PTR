event_inherited()
ds_map_set(player_hurtstates, (42 << 0), 30)
ds_map_set(player_hurtstates, (41 << 0), 50)
ds_map_set(player_hurtstates, (104 << 0), 20)
ds_map_set(player_hurtstates, (121 << 0), 30)
ds_map_set(player_hurtstates, (47 << 0), 60)
ds_map_set(boss_hurtstates, (244 << 0), 60)
ds_map_set(boss_hurtstates, (245 << 0), 50)
ds_map_set(boss_hurtstates, (246 << 0), 50)
ds_map_set(boss_hurtstates, (248 << 0), 50)
ds_map_set(boss_hurtstates, (249 << 0), 50)
hitlist = ds_list_create()
image_speed = 0.35
max_hp = 3600
hp = max_hp
shot = 0
phase = 0
has_attacked = 0
floatdir = 1
attackbuffermax = 180
attackbuffer = attackbuffermax
phase1attacks = [(226 << 0), (228 << 0), (227 << 0), (229 << 0)]
lostattacks = array_length(phase1attacks)
parrycount = 0
transitionstate = 0
bombtimer = 0
hasbomb = 0
bombgrabID = -4
knightbuffer = 0
spawnpool = [465, 431]
hitplayer = 0
function player_hurt(argument0, argument1)
{
    var _prevstate = state
    if (phase < 2)
        SUPER_player_hurt(argument0, argument1)
    else if ((argument1.state != (84 << 0) or argument1.parry_inst == -4) && argument1.state != (147 << 0) && ds_list_find_index(hitlist, argument1) == -1)
    {
        ds_list_add(hitlist, argument1)
        SUPER_player_hurt(argument0, argument1)
        state = _prevstate
        hitplayer = 1
    }
    exit;
}

function boss_hurt(argument0, argument1)
{
    if (phase == 0)
        SUPER_boss_hurt(argument0, argument1)
    else
    {
        var _removehp = 1
        with (argument1)
        {
            if (state != (43 << 0) && state != (47 << 0))
                scr_pummel()
            else if (state == (47 << 0) && vsp > 0 && y < (other.y - 30))
            {
                sprite_index = spr_knightpep_doublejump
                image_index = 0
                vsp = -11
                movespeed = 6
            }
            else if (state != (43 << 0) && state != (147 << 0))
                _removehp = 0
            if (state == (43 << 0))
                movespeed = 4
        }
        if _removehp
        {
            hp -= argument0
            scr_soundeffect(sfx_killingblow)
        }
    }
    exit;
}

function boss_hurt_noplayer(argument0)
{
    if (inv_timer <= 0)
    {
        hp -= argument0
        inv_timer = 10
    }
    exit;
}

