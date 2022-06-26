if (!instance_exists(baddieID))
{
    instance_destroy()
    exit;
}
x = baddieID.x
y = baddieID.y
image_xscale = baddieID.image_xscale
if (col_buffer > 0)
    col_buffer--
else if (col_buffer == 0)
{
    col_buffer = -1
    collisioned = 0
}
if (baddieID.state != (166 << 0) && baddieID.state != (61 << 0))
    instance_destroy()
