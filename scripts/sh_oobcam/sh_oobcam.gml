function sh_oobcam()
{
	WC_oobcam = !WC_oobcam;
	if !isOpen
	{
		with obj_tv
		{
			showtext = true;
			alarm[0] = 100;
			message = "LIMITLESS CAMERA " + (other.WC_oobcam ? "ON" : "OFF");
		}
	}
	else
		return "Limitless camera " + (WC_oobcam ? "ON" : "OFF");
}
function meta_oobcam()
{
	return {
		description: "toggles the limitless camera",
	}
}
