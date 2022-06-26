image_xscale = playerid.xscale
x = playerid.x
y = playerid.y
if ((playerid.image_index > 3 or playerid.state != (23 << 0)) && playerid.state != (42 << 0) && playerid.state != (19 << 0))
    instance_destroy()
