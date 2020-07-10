// CONTROLS
Forward_Check = keyboard_check(vk_left) || gamepad_button_check(global.GP2_index, gp_padr);
Forward_Pressed = keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(global.GP2_index, gp_padr);
Forward_Released = keyboard_check_released(vk_left) || gamepad_button_check_released(global.GP2_index, gp_padr);
Backward_Check = keyboard_check(vk_right) || gamepad_button_check(global.GP2_index, gp_padl);
Backward_Pressed = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(global.GP2_index, gp_padl);
Backward_Released = keyboard_check_released(vk_right) || gamepad_button_check_released(global.GP2_index, gp_padl);
Down_Check = keyboard_check(vk_down) || gamepad_button_check(global.GP2_index, gp_padd);
Down_Pressed = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(global.GP2_index, gp_padd);
Down_Released = keyboard_check_released(vk_down) || gamepad_button_check_released(global.GP2_index, gp_padd);
Up_Check = keyboard_check(vk_up) || gamepad_button_check(global.GP2_index, gp_padu);
Up_Pressed = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(global.GP2_index, gp_padu);
Up_Released = keyboard_check_released(vk_up) || gamepad_button_check_released(global.GP2_index, gp_padu);
Attack_Check = keyboard_check(vk_numpad1) || gamepad_button_check(global.GP2_index, gp_face3);
Attack_Pressed = keyboard_check_pressed(vk_numpad1) || gamepad_button_check_pressed(global.GP2_index, gp_face3);
Attack_Released = keyboard_check_released(vk_numpad1) || gamepad_button_check_released(global.GP2_index, gp_face3);
Special_Check = keyboard_check(vk_numpad2) || gamepad_button_check(global.GP2_index, gp_face4);
Special_Pressed = keyboard_check_pressed(vk_numpad2) || gamepad_button_check_pressed(global.GP2_index, gp_face4);;
Special_Released = keyboard_check_released(vk_numpad2) || gamepad_button_check_released(global.GP2_index, gp_face4);;
Block_Check = keyboard_check(vk_numpad3) || gamepad_button_check(global.GP2_index, gp_face1);
Block_Pressed = keyboard_check_pressed(vk_numpad3) || gamepad_button_check_pressed(global.GP2_index, gp_face1);
Block_Released = keyboard_check_released(vk_numpad3) || gamepad_button_check_released(global.GP2_index, gp_face1);


// Buffer activate
if(Attack_Pressed){
	Abuffer = global.bufferAmount;
}
else if(Special_Pressed){
	Sbuffer = global.bufferAmount;
}
if(Down_Pressed){
	Dbuffer = 16;
}

// Buffer cancel
if(Block_Pressed){
	Abuffer = 0;
	Sbuffer = 0;
}

// Remove L hitbox if air attack
if(aerial && action != "none" && place_meeting(x, y+18, HitBox_Obj)){
	hitbox = instance_position(x, y+18, HitBox_Obj);

	if(hitbox != noone && hitbox.spawner == "P1" && hitbox.type = "L"){
		with(hitbox) instance_destroy();
	}
}

// Friction fix
if(action = "stunned" || action = "dead"){
	friction = 0.25;
}
else if(action == "none"){
	friction = 0;
}

// Depth fix
if(action = "none" || action = "stunned" || action = "launched"){
	depth = 0;
}
else{
	depth = -1;
}

// Bleed logic (Knives relevant)
if(bleed > 0 && bleed < 100){
	bleed -= 0.2;
}
else if(bleed >= 100 && HP > 0){
	bleed = 100;
}