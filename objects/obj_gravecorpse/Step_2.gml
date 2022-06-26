image_index = playerid.image_index
image_xscale = playerid.xscale
x = playerid.x
y = playerid.y
visible = playerid.visible
if (playerid.sprite_index == spr_player_corpsesurf)
    sprite_index = spr_corpsesurf
if (playerid.sprite_index == spr_player_corpsestart)
    sprite_index = spr_corpsestart
if (playerid.state != (211 << 0) && playerid.state != (61 << 0))
    instance_destroy()
