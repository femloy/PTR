function add_achievement_update(argument0, argument1, argument2, argument3)
{
    var q = 
    {
        name: argument0,
        update_rate: argument1,
        frames: 0,
        update_func: -4,
        creation_code: -4,
        variables: ds_map_create(),
        unlocked: 0
    }

    q.update_func = method(q, argument3)
    if (argument2 != -4)
    {
        q.creation_code = method(q, argument2)
        q.q.creation_code()
    }
    ds_list_add(obj_achievementtracker.achievements_update, q)
    return q;
}

function add_achievement_notify(argument0, argument1, argument2)
{
    var q = 
    {
        name: argument0,
        creation_code: -4,
        func: -4,
        unlocked: 0,
        variables: ds_map_create()
    }

    q.func = method(q, argument2)
    if (argument1 != -4)
    {
        q.creation_code = method(q, argument1)
        q.q.creation_code()
    }
    ds_list_add(obj_achievementtracker.achievements_notify, q)
    return q;
}

function notification_push(argument0, argument1)
{
    with (obj_achievementtracker)
        ds_queue_enqueue(notify_queue, [argument0, argument1])
    exit;
}

function achievement_add_variable(argument0, argument1, argument2 = 0)
{
    var q = 
    {
        init_value: argument1,
        value: argument1,
        save: argument2
    }

    ds_map_add(variables, argument0, q)
    return q;
}

function achievement_get_variable(argument0)
{
    return ds_map_find_value(variables, argument0);
}

function achievement_unlock(argument0, argument1, argument2)
{
    var b = achievement_get_struct(argument0)
    with (b)
    {
        unlocked = 1
        tv_push_prompt(argument1, (0 << 0), argument2, 2)
        quick_ini_write_real(get_savefile_ini(), "achievements", name, 1)
        gamesave_async_save()
    }
    with (obj_achievementviewer)
        event_perform(ev_other, ev_room_start)
}

function achievement_save_variables(argument0)
{
    for (var i = 0; i < ds_list_size(argument0); i++)
    {
        var b = ds_list_find_value(argument0, i)
        with (b)
        {
            var size = ds_map_size(variables)
            var key = ds_map_find_first(variables)
            for (i = 0; i < size; i++)
            {
                q = ds_map_find_value(variables, key)
                if q.save
                    quick_ini_write_real(get_savefile_ini(), "achievements_variables", key, q.value)
                key = ds_map_find_next(variables, key)
            }
        }
    }
}

function achievements_load(argument0)
{
    for (var i = 0; i < ds_list_size(argument0); i++)
    {
        var b = ds_list_find_value(argument0, i)
        with (b)
        {
            unlocked = ini_read_real("achievements", name, 0)
            size = ds_map_size(variables)
            key = ds_map_find_first(variables)
            for (i = 0; i < size; i++)
            {
                q = ds_map_find_value(variables, key)
                if q.save
                    q.value = ini_read_real("achievements_variables", key, q.init_value)
                key = ds_map_find_next(variables, key)
            }
        }
    }
}

function achievement_get_struct(argument0)
{
    var l = obj_achievementtracker.achievements_update
    var b = noone
	
	for(var i = 0; i < ds_list_size(l); i++)
	{
		var q = ds_list_find_value(l, i)
        if (q.name == argument0)
        {
            b = q
            break
        }
	}
    if (b == noone)
    {
        l = obj_achievementtracker.achievements_notify
		for(var i = 0; i < ds_list_size(l); i++)
		{
			b = ds_list_find_value(l, i)
            if (q.name == argument0)
            {
                b = q
                break
            }
		}
    }
    return b;
}
