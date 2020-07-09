// CONTROLS
Forward_Check = keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr);
Forward_Pressed = keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr);
Forward_Released = keyboard_check_released(ord("D")) || gamepad_button_check_released(0, gp_padr);
Backward_Check = keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl);
Backward_Pressed = keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl);
Backward_Released = keyboard_check_released(ord("A")) || gamepad_button_check_released(0, gp_padl);
Down_Check = keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd);
Down_Pressed = keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd);
Down_Released = keyboard_check_released(ord("S")) || gamepad_button_check_released(0, gp_padd);
Up_Check = keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu);
Up_Pressed = keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu);
Up_Released = keyboard_check_released(ord("W")) || gamepad_button_check_released(0, gp_padu);
Attack_Check = keyboard_check(ord("B")) || gamepad_button_check(0, gp_face3);
Attack_Pressed = keyboard_check_pressed(ord("B")) || gamepad_button_check_pressed(0, gp_face3);
Attack_Released = keyboard_check_released(ord("B")) || gamepad_button_check_released(0, gp_face3);
Special_Check = keyboard_check(ord("N")) || gamepad_button_check(0, gp_face4);
Special_Pressed = keyboard_check_pressed(ord("N")) || gamepad_button_check_pressed(0, gp_face4);;
Special_Released = keyboard_check_released(ord("N")) || gamepad_button_check_released(0, gp_face4);;
Block_Check = keyboard_check(ord("M")) || gamepad_button_check(0, gp_face1);
Block_Pressed = keyboard_check_pressed(ord("M")) || gamepad_button_check_pressed(0, gp_face1);
Block_Released = keyboard_check_released(ord("M")) || gamepad_button_check_released(0, gp_face1);


// Buffer activate
if(Attack_Check){
	Abuffer = global.bufferAmount;
}
else if(Special_Check){
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

	if(hitbox != noone && hitbox.spawner == "P2" && hitbox.type = "L"){
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
	bleed -= 0.4;
}
else if(bleed >= 100 && HP > 0){
	bleed = 100;
}