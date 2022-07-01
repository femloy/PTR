var _sound = 0
if place_meeting(x, y, obj_player)
{
	with (obj_hiddenobject)
	{
		if ((!activated) && trigger == other.trigger)
		{
			_sound = 1
			event_user(0)
		}
	}
}
if _sound
	scr_soundeffect(global.gameplay == gameplay.remix ? sfx_secretwall : sfx_collectgiantpizza)
