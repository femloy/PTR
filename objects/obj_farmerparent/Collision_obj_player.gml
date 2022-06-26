instance_destroy()
global.hasfarmer[pos] = 1
other.farmerpos = pos
switch object_index
{
    case obj_farmerpeasanto:
        instance_create_unique(x, y, obj_farmer1follow)
        break
    case 50:
        instance_create_unique(x, y, obj_farmer2follow)
        break
    case 711:
        instance_create_unique(x, y, obj_farmer3follow)
        break
}

