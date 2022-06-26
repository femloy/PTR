image_xscale = playerid.xscale
if (playerid.supercharged == 0)
{
    playerid.superchargedeffectid = -4
    instance_destroy()
}
x = playerid.x
y = playerid.y
if (playerid.state != (95 << 0) && playerid.state != (112 << 0))
    visible = playerid.visible
else
    visible = false
if (global.combotime == 0)
{
    playerid.supercharged = 0
    playerid.supercharge = 0
    playerid.superchargedeffectid = -4
    instance_destroy()
}
