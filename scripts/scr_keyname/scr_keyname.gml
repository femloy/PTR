function scr_keyname(argument0)
{
    switch argument0
    {
        case 38:
            return "UP";
        case 39:
            return "RIGHT";
        case 37:
            return "LEFT";
        case 40:
            return "DOWN";
        case 13:
            return "ENTER";
        case 27:
            return "ESCAPE";
        case 32:
            return "SPACE";
        case 161:
            return "SHIFT";
        case 160:
            return "SHIFT";
        case 16:
            return "SHIFT";
        case 17:
            return "CONTROL";
        case 162:
            return "CONTROL";
        case 163:
            return "CONTROL";
        case 18:
            return "ALT";
        case 164:
            return "ALT";
        case 8:
            return "BACKSPACE";
        case 9:
            return "TAB";
        case 36:
            return "HOME";
        case 35:
            return "END";
        case 46:
            return "DELETE";
        case 45:
            return "INSERT";
        case 33:
            return "PAGE UP";
        case 34:
            return "PAGE DOWN";
        case 19:
            return "PAUSE";
        case 44:
            return "PRINTSCREEN";
        case 112:
            return "F1";
        case 113:
            return "F2";
        case 114:
            return "F3";
        case 115:
            return "F4";
        case 116:
            return "F5";
        case 117:
            return "F6";
        case 118:
            return "F7";
        case 119:
            return "F8";
        case 120:
            return "F9";
        case 121:
            return "F10";
        case 122:
            return "F11";
        case 123:
            return "F12";
        case 96:
            return "NUMPAD 0";
        case 97:
            return "NUMPAD 1";
        case 98:
            return "NUMPAD 2";
        case 99:
            return "NUMPAD 3";
        case 100:
            return "NUMPAD 4";
        case 101:
            return "NUMPAD 5";
        case 102:
            return "NUMPAD 6";
        case 103:
            return "NUMPAD 7";
        case 104:
            return "NUMPAD 8";
        case 105:
            return "NUMPAD 9";
        case 106:
            return "MULTIPLY";
        case 111:
            return "DIVIDE";
        case 107:
            return "ADD";
        case 109:
            return "SUBTRACT";
        case 110:
            return "DECIMAL";
        case -1:
            return "PRESS KEY";
    }

    return chr(argument0);
}

