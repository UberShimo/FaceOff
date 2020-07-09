/// @description CONTROLS
Forward_Check = keyboard_check(vk_left) || gamepad_button_check(1, gp_padr);
Forward_Pressed = keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(1, gp_padr);
Forward_Released = keyboard_check_released(vk_left) || gamepad_button_check_released(1, gp_padr);
Backward_Check = keyboard_check(vk_right) || gamepad_button_check(1, gp_padl);
Backward_Pressed = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(1, gp_padl);
Backward_Released = keyboard_check_released(vk_right) || gamepad_button_check_released(1, gp_padl);
Down_Check = keyboard_check(vk_down) || gamepad_button_check(1, gp_padd);
Down_Pressed = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(1, gp_padd);
Down_Released = keyboard_check_released(vk_down) || gamepad_button_check_released(1, gp_padd);
Up_Check = keyboard_check(vk_up) || gamepad_button_check(1, gp_padu);
Up_Pressed = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(1, gp_padu);
Up_Released = keyboard_check_released(vk_up) || gamepad_button_check_released(1, gp_padu);
Attack_Check = keyboard_check(vk_numpad1) || gamepad_button_check(1, gp_face3);
Attack_Pressed = keyboard_check_pressed(vk_numpad1) || gamepad_button_check_pressed(1, gp_face3);
Attack_Released = keyboard_check_released(vk_numpad1) || gamepad_button_check_released(1, gp_face3);
Special_Check = keyboard_check(vk_numpad2) || gamepad_button_check(1, gp_face4);
Special_Pressed = keyboard_check_pressed(vk_numpad2) || gamepad_button_check_pressed(1, gp_face4);;
Special_Released = keyboard_check_released(vk_numpad2) || gamepad_button_check_released(1, gp_face4);;
Block_Check = keyboard_check(vk_numpad3) || gamepad_button_check(1, gp_face1);
Block_Pressed = keyboard_check_pressed(vk_numpad3) || gamepad_button_check_pressed(1, gp_face1);
Block_Released = keyboard_check_released(vk_numpad3) || gamepad_button_check_released(1, gp_face1);