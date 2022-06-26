if (other.state != (61 << 0) && other.skateboarding == 0)
{
    instance_create(x, y, obj_genericpoofeffect)
    other.movespeed = 10
    other.state = (104 << 0)
    other.skateboarding = 1
    tv_push_prompt_once(tv_create_prompt("This is the clown transformation text", (2 << 0), 1197, 3), "skateboard")
}
