/// @description CONTROLS
Right_Pressed = keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(global.GP1_index, gp_padr);
Left_Pressed = keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(global.GP1_index, gp_padl);
Down_Pressed = keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(global.GP1_index, gp_padd);
Up_Pressed = keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(global.GP1_index, gp_padu);
Choose_Pressed = keyboard_check_pressed(ord("B")) || gamepad_button_check_pressed(global.GP1_index, gp_face1);
Back_Pressed = keyboard_check_pressed(ord("N")) || gamepad_button_check_pressed(global.GP1_index, gp_face2);
