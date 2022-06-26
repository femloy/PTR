event_inherited()
switch object_index
{
    case obj_pizzakincheese:
        if (!global.cheesefollow)
            instance_destroy()
        break
    case 541:
        if (!global.tomatofollow)
            instance_destroy()
        break
    case 543:
        if (!global.pineapplefollow)
            instance_destroy()
        break
    case 539:
        if (!global.shroomfollow)
            instance_destroy()
        break
    case 542:
        if (!global.sausagefollow)
            instance_destroy()
        break
}

