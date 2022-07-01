function sh_freeze(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if array_length(args) < 2
		return "Missing argument: instance";
	
	if args[1] == "global"
		var inst = global;
	else
	{
		var inst = WCscr_findobj(args[1]);
		if !instance_exists(inst[0])
			return "The instance of " + args[1] + " does not exist";
		inst = inst[0];
	}
	
	if array_length(args) < 3
		return "Missing argument: variable";
	
	var variable = args[2];
	if variable_instance_exists(inst, variable)
	{
		var res = false;
		if inst == global
			res = WCscr_freezevar(global, variable);
		else with inst
			res = other.WCscr_freezevar(self, variable);
		
		return (res ? "Frozen " : "Unfrozen ") + args[1] + "." + args[2];
	}
	else
		return args[1] + "." + args[2] + " doesn't exist";
}
function meta_freeze()
{
	return
	{
		description: "freeze an instance's variable or a global variable",
		arguments: ["instance", "variable"],
		suggestions: [
			function()
			{
				var obj_array = [];
				for(var i = 0; i < instance_count; i++)
				{
					var inst = instance_find(all, i);
					if !instance_exists(inst)
						continue;
					var obj = inst.object_index;
					
					for(var j = 0; j < instance_number(obj); j++)
					{
						if instance_find(obj, j).id == inst.id
							array_push(obj_array, object_get_name(obj) + ":" + string(j));
					}
				}
				array_sort(obj_array, true);
				array_insert(obj_array, 0, "global");
				return obj_array;
			},
			[]
		],
		argumentDescriptions: [
			"either just \"global\" or an instance",
			"the name of the variable to be frozen",
		],
	}
}

