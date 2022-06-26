event_inherited()
attack_pool[0] = [(42 << 0), (92 << 0)]
attack_pool[1] = [(77 << 0), (167 << 0)]
attack_pool[2] = [(42 << 0), (74 << 0), (168 << 0)]
attack_pool[3] = [(58 << 0), (169 << 0)]
attack_pool[4] = [(170 << 0), (172 << 0), (173 << 0)]
attack_pool[5] = [(42 << 0), (92 << 0), (77 << 0), (167 << 0), (74 << 0), (168 << 0), (58 << 0), (169 << 0), (170 << 0), (172 << 0), (173 << 0)]
attack_pool[6] = [(42 << 0), (92 << 0), (77 << 0), (167 << 0)]
attack_pool[7] = [(42 << 0), (74 << 0), (168 << 0), (58 << 0), (169 << 0)]
attack_pool[8] = [(170 << 0), (172 << 0), (173 << 0)]
attack_type[(42 << 0)] = [(1 << 0), (1 << 0)]
attack_type[(92 << 0)] = [(3 << 0), (1 << 0)]
attack_type[(77 << 0)] = [(2 << 0), (2 << 0)]
attack_type[(167 << 0)] = [(3 << 0), (3 << 0)]
attack_type[(74 << 0)] = [(3 << 0), (3 << 0)]
attack_type[(168 << 0)] = [(2 << 0), (2 << 0)]
attack_type[(58 << 0)] = [(3 << 0), (3 << 0)]
attack_type[(169 << 0)] = [(3 << 0), (3 << 0)]
attack_type[(170 << 0)] = [(3 << 0), (3 << 0)]
attack_type[(172 << 0)] = [(3 << 0), (3 << 0)]
attack_type[(173 << 0)] = [(1 << 0), (1 << 0)]
current_behaviour = (0 << 0)
current_attack = (42 << 0)
state = (145 << 0)
ds_map_set(player_hurtstates, (42 << 0), 30000)
ds_map_set(player_hurtstates, (41 << 0), 50)
ds_map_set(player_hurtstates, (104 << 0), 20)
ds_map_set(player_hurtstates, (121 << 0), 30)
ds_map_set(boss_hurtstates, (80 << 0), 30)
ds_map_set(boss_hurtstates, (42 << 0), 30)
ds_map_set(boss_hurtstates, (102 << 0), 30)
ds_map_set(boss_hurtstates, (77 << 0), 60)
ds_map_set(boss_hurtstates, (58 << 0), 30)
ds_map_set(boss_hurtstates, (171 << 0), 80)
ds_map_set(boss_hurtstates, (173 << 0), 80)
phase = 1
max_phase = 9
max_hp = (500 * max_phase)
hp = max_hp
stunfallspr = spr_playerN_hurt
walkspr = spr_playerN_move
idlespr = spr_playerN_idle
spr_dead = spr_playerN_hurt
tauntspr = spr_playerN_taunt
fallspr = spr_playerN_fall
bumpspr = spr_playerN_bump
parryspr = spr_playerN_spin
defeatplayerspr = spr_playerN_spin
movespeed = 0
move = 0
normal_spd = 6
changeside_spd = 10
slide = 0
slidejump = 0
skateboard_turns = 0
bombkick = 0
bombpogo = 0
pogochargeactive = 0
pogospeedprev = 0
pogomach = 0
pogospeed = 0
jetpackcancel = 0
fakedeath = 1
angry = 1
spin_count = 0
slideskateboard = 0
spinskateboard = 0
bombcount = 0
jumpcount = 0
pogo_buffer = 0
pogo_max = 240
pogo_random = 4
spin_buffer = 0
spin_max = 18
chooseparry_max[0] = 480
chooseparry_max[1] = 420
chooseparry_max[2] = 360
chooseparry_max[3] = 300
chooseparry_max[4] = 300
chooseparry_max[5] = 300
chooseparry_max[6] = 300
chooseparry_max[7] = 300
chooseparry_max[8] = 300
chooseparry_random = 4
chooseparry_buffer = chooseparry_max[(phase - 1)]
taunt_buffer = 0
taunt_max = 25
attack_max[0] = 25
attack_max[1] = 25
attack_max[2] = 25
attack_max[3] = 25
attack_max[4] = 25
attack_max[5] = 25
attack_max[6] = 25
attack_max[7] = 25
attack_max[8] = 25
attack_cooldown = attack_max[0]
dashcloudid = -4
targetstunned = 0
targetstunnedminus[0] = 30
targetstunnedminus[1] = 30
targetstunnedminus[2] = 30
targetstunnedminus[3] = 30
targetstunnedminus[4] = 30
targetstunnedminus[5] = 30
targetstunnedminus[6] = 30
targetstunnedminus[7] = 30
targetstunnedminus[8] = 30
function boss_destroy(argument0)
{
    SUPER_boss_destroy(argument0)
    targetstunned = 1000
    stunned = 1000
    if fakedeath
    {
        angry = 1
        fakedeath = 0
        destroyable = 0
        with (obj_bosscontroller)
        {
            alarm[1] = (room_speed * 4)
            fakedeath = 1
            state = (8 << 0)
            depth = (other.depth + 1)
        }
    }
    else
    {
        global.noisecutscene2 = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "noise2", 1)
    }
    exit;
}

function boss_hurt(argument0, argument1)
{
    if (targetstunned > 0)
    {
        targetstunned -= targetstunnedminus[(phase - 1)]
        attack_cooldown = 0
        boss_noise_decide_attack()
        if (targetstunned < 0)
            targetstunned = 1
    }
    else
        targetstunned = 150
    var ps = state
    SUPER_boss_hurt(argument0, argument1)
    if (ps == (58 << 0))
        movespeed = 0
    targetxscale = (-argument1.xscale)
    exit;
}

function boss_hurt_noplayer(argument0)
{
    if (targetstunned > 0)
    {
        targetstunned -= targetstunnedminus[(phase - 1)]
        attack_cooldown = 0
        if (targetstunned < 0)
            targetstunned = 1
    }
    else
        targetstunned = 150
    SUPER_boss_hurt_noplayer(argument0)
    exit;
}

function player_hurt(argument0, argument1)
{
    if ((!argument1.inv_frames) && (argument1.state != (84 << 0) or argument1.parry_inst == -4))
    {
        hitstate = state
        hithsp = hsp
        hitvsp = vsp
        SUPER_player_hurt(argument0, argument1)
        with (argument1)
        {
            inv_frames = 1
            alarm[1] = 15
        }
        if (hitstate == (77 << 0) or hitstate == (171 << 0))
        {
            stunned = (hitstate == (77 << 0) ? 30 : 70)
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
            hitstate = (138 << 0)
            movespeed = 0
            hitvsp = -4
            hithsp = ((-image_xscale) * 8)
        }
    }
    exit;
}

