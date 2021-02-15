/// @description CONTROLS
Right_Pressed = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(global.GP2_index, gp_padr);
Left_Pressed = keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(global.GP2_index, gp_padl);
Down_Pressed = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(global.GP2_index, gp_padd);
Up_Pressed = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(global.GP2_index, gp_padu);
Choose_Pressed = keyboard_check_pressed(vk_numpad1) || gamepad_button_check_pressed(global.GP2_index, gp_face1);
Back_Pressed = keyboard_check_pressed(vk_numpad2) || gamepad_button_check_pressed(global.GP2_index, gp_face2);
