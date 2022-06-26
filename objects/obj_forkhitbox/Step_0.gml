if (!instance_exists(ID))
{
    instance_destroy()
    exit;
}
x = ID.x
y = ID.y
image_xscale = ID.image_xscale
image_yscale = ID.image_yscale
with (ID)
{
    if (object_index == obj_coolpineapple or object_index == obj_ghostknight or object_index == obj_forknight or object_index == obj_noisey or object_index == obj_smokingpizzaslice)
    {
        if (state != (134 << 0) && state != (125 << 0))
        {
            hitboxcreate = 0
            instance_destroy(other)
        }
    }
    switch object_index
    {
        case obj_pepperman:
            other.x = (x + (image_xscale * 8))
            if (state != (153 << 0))
                instance_destroy(other)
            break
        case 578:
            other.x = (x + (image_xscale * 16))
            if (state != (80 << 0))
                instance_destroy(other)
            break
        case 104:
        case 26:
        case 178:
            other.x = (x + (image_xscale * 16))
            if (state != (80 << 0))
                instance_destroy(other)
            break
        case 264:
            other.x = (x - (image_xscale * 10))
            if (state != (80 << 0))
                instance_destroy(other)
            break
        case 800:
            other.x = (x + (image_xscale * 32))
            break
        case 442:
            if (state != (104 << 0) && state != (23 << 0) && state != (91 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            else if (state == (23 << 0))
                other.x = (x + (image_xscale * 32))
            else if (state == (104 << 0) or state == (91 << 0))
                other.x = (x + (image_xscale * 20))
            break
        case 176:
            other.x = (x + (image_xscale * 24))
            if (state != (125 << 0))
                instance_destroy(other)
            break
        case 471:
            if (state != (134 << 0) && sprite_index != spr_indiancheese_howl)
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
        case 408:
        case 432:
        case 433:
            if (state != (80 << 0))
            {
                instance_destroy(other)
                punchinst = -4
            }
            break
        case 824:
            if (state != (80 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
        case 436:
            if (state != (125 << 0) && state != (80 << 0))
                instance_destroy(other)
            break
        case 464:
            if (state != (128 << 0) && state != (80 << 0))
                instance_destroy(other)
            if (state == (80 << 0))
            {
                if (image_index > 14)
                    instance_destroy(other)
                other.x = (x + (image_xscale * 24))
            }
            break
        case 599:
            if (!hitwall)
                instance_destroy(other)
            break
        case 773:
            if (obj_player1.instakillmove or obj_player1.state == (42 << 0))
            {
                instance_destroy(other)
                hitboxcreate = 0
            }
            break
        case 451:
            if (state != (129 << 0))
                instance_destroy(other)
            break
        case 463:
        case 472:
        case 439:
        case 469:
            if (state != (128 << 0) && state != (125 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
    }

}
