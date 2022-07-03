fadealpha -= 0.1
if fadealpha < 0
	instance_destroy()

if instance_exists(obj_fadeout)
{
	obj_fadeout.fadealpha = fadealpha;
	instance_destroy();
}
