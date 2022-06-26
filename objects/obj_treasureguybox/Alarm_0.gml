if (current_arr > (array_length(content_arr) - 1))
    exit;
if audio_is_playing(sfx_collecttopping)
    audio_stop_sound(sfx_collecttopping)
scr_soundeffect(sfx_collecttopping)
global.heattime += 10
global.heattime = clamp(global.heattime, 0, 60)
global.combotime += 10
global.combotime = clamp(global.combotime, 0, 60)
with (obj_camera)
    healthshaketime = 30
var val = heat_calculate(10)
global.collect += val
create_collect(x, y, choose(1559, 1561, 1562, 1563, 1560))
with (instance_create((x + 16), y, obj_smallnumber))
    number = string(val)
current_arr++
alarm[0] = count
