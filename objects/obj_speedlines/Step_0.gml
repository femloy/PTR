x = playerid.x
y = playerid.y
image_xscale = playerid.xscale
if (abs(playerid.hsp) <= 0 or playerid.movespeed < 16 or playerid.state == (95 << 0) or playerid.state == (112 << 0) or room == timesuproom)
    instance_destroy()
if (room == timesuproom)
    instance_destroy()
