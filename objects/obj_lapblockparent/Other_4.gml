var noid = true;
with object_index
{
	if variable_instance_exists(id, "index")
		noid = false;
}
if noid
{
	for(var i = 0; i < instance_number(object_index); i++)
	{
		with instance_find(object_index, i)
			index = i + other.indexoffset;
	}
}

var me = id;
with object_index
{
	var them = id;
	
	// distance to next
	if index == me.index + 1
	{
		with me
		{
			disnext = distance_to_object(them);
			nextobj = them.id;
		}
	}
	
	// distance to previous
	if index == me.index - 1
	{
		with me
		{
			disprev = distance_to_object(them);
			prevobj = them.id;
		}
	}
}
