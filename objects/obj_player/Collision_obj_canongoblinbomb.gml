if (hurted == 0 && other.grounded == 0 && state != (84 << 0) && state != (147 << 0))
{
    instance_destroy(other)
    instance_create(x, y, obj_canonexplosion)
}
