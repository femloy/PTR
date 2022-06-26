image_xscale = playerid.xscale
if (playerid.state != (184 << 0) && playerid.state != (121 << 0) && playerid.state != (102 << 0) && playerid.state != (153 << 0))
    instance_destroy()
x = (playerid.x + ((playerid.character == "M" ? 18 : 0) * playerid.xscale))
y = (playerid.y - (playerid.character == "M" ? 10 : 0))
if (playerid.state == (184 << 0))
    x = (playerid.x + (playerid.xscale * 18))
visible = (!(room == rank_room))
if (place_meeting(x, y, obj_secretportal) or place_meeting(x, y, obj_secretportalstart))
    visible = false
