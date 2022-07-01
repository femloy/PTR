function sh_monitorvar(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	
	if array_length(args) < 2
		return "Missing argument: instance";
	
	if args[1] == "global"
		var inst = global;
	else if args[1] == "all"
		return "You can't monitor all objects";
	else
	{
		var inst = WCscr_findobj(args[1]);
		if object_exists(inst[0]) && !inst[1]
			return "Must specify instance index. Example: " + object_get_name(inst[0]) + ":0";
		if !instance_exists(inst[0])
			return "The instance of " + args[1] + " does not exist";
		inst = inst[0];
	}
	
	if array_length(args) < 3
		return "Missing argument: variable";
	
	var variables = [];
	for(var i = 2; i < array_length(args); i++)
	{
		if variable_instance_exists(inst, args[i])
			array_push(variables, args[i]);
		else
			return args[1] + "." + args[i] + " doesn't exist";
	}
	
	// create window
	var title = "Monitoring " + args[1];
	draw_set_font(consoleFont);
	var w = string_width(title) + 12;
	
	var win = new WCwin(32, 32, title);
	with win
	{
		win_width = w;
		
		_inst = inst;
		_var = variables;
		
		draw = function()
		{
			if _inst != global && !instance_exists(_inst)
				var txt = "(The instance was deleted)";
			else
			{
				var txt = "";
				for(var i = 0; i < array_length(_var); i++)
				{
					if i != 0
						txt += "\n";
					txt += _var[i] + " : " + string(variable_instance_get(_inst, _var[i]));
				}
			}
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
					
			draw_text(win_width / 2, win_height / 2, txt);
					
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
		}
	}
			
	// add window to window list
	win.add();
}
function meta_monitorvar()
{
	return
	{
		description: "monitor an instance's variable or a global variable in a pop-up window",
		arguments: ["instance", "variables"],
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
			"either just \"global\" or the instance to check",
			"the variable name to be checked, can be more than just one",
		],
	}
}

