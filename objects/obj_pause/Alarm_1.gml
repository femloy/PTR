/// @description level reset
global.levelreset = false
scr_playerreset()
global.levelreset = true
						
with obj_player
	targetDoor = "A"

scr_room_goto(global.leveltorestart)
pause = false
