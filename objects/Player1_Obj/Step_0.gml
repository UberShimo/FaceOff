// Buffer activate
if(keyboard_check(global.P1_Attack)){
	Abuffer = global.bufferAmount;
}
else if(keyboard_check(global.P1_Special)){
	Sbuffer = global.bufferAmount;
}
if(keyboard_check_pressed(global.P1_Down)){
	Dbuffer = 16;
}

// Buffer cancel
if(keyboard_check_pressed(global.P1_Block)){
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