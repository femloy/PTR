function scr_checkanygamepad()
{
    if gamepad_button_check_pressed(0, gp_face1)
        return 32769;
    else if gamepad_button_check_pressed(0, gp_face2)
        return 32770;
    else if gamepad_button_check_pressed(0, gp_face3)
        return 32771;
    else if gamepad_button_check_pressed(0, gp_face4)
        return 32772;
    else if gamepad_button_check_pressed(0, gp_shoulderl)
        return 32773;
    else if gamepad_button_check_pressed(0, gp_shoulderlb)
        return 32775;
    else if gamepad_button_check_pressed(0, gp_shoulderr)
        return 32774;
    else if gamepad_button_check_pressed(0, gp_shoulderrb)
        return 32776;
    else if gamepad_button_check_pressed(0, gp_select)
        return 32777;
    else if gamepad_button_check_pressed(0, gp_start)
        return 32778;
    else if gamepad_button_check_pressed(0, gp_stickl)
        return 32779;
    else if gamepad_button_check_pressed(0, gp_stickr)
        return 32780;
    else if gamepad_button_check_pressed(0, gp_padu)
        return 32781;
    else if gamepad_button_check_pressed(0, gp_padd)
        return 32782;
    else if gamepad_button_check_pressed(0, gp_padl)
        return 32783;
    else if gamepad_button_check_pressed(0, gp_padr)
        return 32784;
    else if gamepad_button_check_pressed(0, gp_axislh)
        return 32785;
    else if gamepad_button_check_pressed(0, gp_axislv)
        return 32786;
    else if gamepad_button_check_pressed(0, gp_axisrh)
        return 32787;
    else if gamepad_button_check_pressed(0, gp_axisrv)
        return 32788;
    exit;
}

