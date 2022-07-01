image_speed = 0.35
depth = -6
following_character_init()
yoffset = 0
spritequeue = ds_queue_create()
ds_list_insert(global.followerlist, 0, id)
pos = ds_list_find_index(global.followerlist, id)
followid = (pos > 0 ? ds_list_find_value(global.followerlist, (pos - 1)) : -4)
following_character_calculate()
sprite_index = obj_player2.spr_idle
