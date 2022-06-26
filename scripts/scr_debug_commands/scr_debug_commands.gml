function string_split(argument0, argument1)
{
    argument0 += " "
    var _current_str = ""
    var _list = [0]
    for (var i = 1; i < (string_length(argument0) + 1); i++)
    {
        var _char = string_char_at(argument0, i)
        if (_char != argument1)
            _current_str += _char
        else
        {
            array_push(_list, _current_str)
            _current_str = ""
        }
    }
    return _list;
}

function function_overload(argument0, argument1)
{
    var _size = array_length(argument0)
    switch (_size - 1)
    {
        case -1:
            argument1()
            break
        case 0:
            argument1(argument0[0])
            break
        case 1:
            argument1(argument0[0], argument0[1])
            break
        case 2:
            argument1(argument0[0], argument0[1], argument0[2])
            break
        case 3:
            argument1(argument0[0], argument0[1], argument0[2], argument0[3])
            break
        case 4:
            argument1(argument0[0], argument0[1], argument0[2], argument0[3], argument0[4])
            break
        case 5:
            argument1(argument0[0], argument0[1], argument0[2], argument0[3], argument0[4], argument0[5])
            break
        case 6:
            argument1(argument0[0], argument0[1], argument0[2], argument0[3], argument0[4], argument0[5], argument0[6])
            break
    }

    exit;
}

function DebugCommand(argument0, argument1, argument2, argument3) constructor
{
    command_id = argument0
    description = argument1
    format = argument2
    func = argument3
    function anon_DebugCommand_gml_GlobalScript_scr_debug_commands_1117_DebugCommand_gml_GlobalScript_scr_debug_commands(argument0)
    {
        if (argument0 != undefined)
            function_overload(argument0, func)
        else
            func()
        exit;
    }

}

function TextList_Add(argument0, argument1)
{
    with (obj_debugcontroller)
    {
    }
    exit;
}

