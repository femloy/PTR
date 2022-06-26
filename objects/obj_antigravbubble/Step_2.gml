x = playerid.x
y = playerid.y
mask_index = playerid.mask_index
xs = Approach(xs, 1, 0.12)
image_xscale = xs
image_yscale = xs
if (place_meeting(x, y, obj_secretportal) or place_meeting(x, y, obj_secretportalstart))
    visible = false
else
    visible = playerid.visible
if (playerid.state != (265 << 0) && playerid.state != (61 << 0) && (playerid.state != (84 << 0) or playerid.tauntstoredstate != (265 << 0)))
    instance_destroy()
