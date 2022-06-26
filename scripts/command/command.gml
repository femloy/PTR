// umt decompilation is FUCKED
var _temp_local_var_3;
function Command() constructor
{
    state = 1
}

function PlaceCommand(argument0, argument1, argument2) constructor
{
    var _temp_local_var_3 = Command()
    if true//@@CopyStatic@@(Command)
    {
    }
    else
    {
        function anon_PlaceCommand_gml_GlobalScript_Command_365_PlaceCommand_gml_GlobalScript_Command()
        {
            if (instance == noone)
            {
                instance = instance_create((snap_tile(x, 32) + object.place_xoffset), (snap_tile(y, 32) + object.place_yoffset), obj_fakeobject)
                with (instance)
                {
                    sprite_index = other.object.sprite_index
                    object = other.object.object_index
                }
                with (obj_editor)
                {
                    scr_editor_clear_selectedobjects()
                    ds_list_add(selectedobjects, other.instance)
                }
            }
            else
                instance_activate_object(instance)
            exit;
        }

        function anon_PlaceCommand_gml_GlobalScript_Command_867_PlaceCommand_gml_GlobalScript_Command()
        {
            instance_deactivate_object(instance)
            exit;
        }

        function anon_PlaceCommand_gml_GlobalScript_Command_948_PlaceCommand_gml_GlobalScript_Command()
        {
            if (state == 0)
            {
                instance_activate_object(instance)
                instance_destroy(instance)
            }
            exit;
        }

    }
    x = argument0
    y = argument1
    object = argument2
    instance = noone
}

