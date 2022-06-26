if ((!instance_exists(baddieID)) or (!baddieID.thrown) or baddieID.state != (138 << 0))
{
    instance_destroy()
    exit;
}
x = baddieID.x
y = baddieID.y
image_xscale = (-baddieID.image_xscale)
