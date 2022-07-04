if global.panic
{
	randomer += 1;
	if global.gameplay == gameplay.remix
	{
		if randomer % 4 == 0
			image_index = irandom_range(0, 1);
		
		if randomer >= 11
			randomer -= 11;
	}
	else
		image_index = floor(randomer * 0.2) % 2;
}
else
{
	image_speed = 0;
	image_index = 1;
}
