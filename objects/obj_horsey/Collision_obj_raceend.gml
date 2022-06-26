hsp = 0
vsp = 0
var x1 = (other.x + (other.sprite_width / 2))
var y1 = ((other.y + other.sprite_height) - 34)
x = Approach(x, x1, spd)
y = Approach(y, y1, spd)
if (x == x1 && y == y1 && state != (89 << 0))
{
    spd = 0
    other.horseyfinish = 1
    state = (6 << 0)
    global.horse = 0
}
