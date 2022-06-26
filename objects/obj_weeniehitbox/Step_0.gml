if ((!instance_exists(baddieID)) or baddieID.state != (5 << 0))
{
    instance_destroy()
    exit;
}
x = baddieID.x
y = baddieID.y
image_xscale = baddieID.image_xscale
