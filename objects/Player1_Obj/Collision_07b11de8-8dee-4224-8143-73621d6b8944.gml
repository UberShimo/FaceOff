if!(action = "launched"){
	h_speed = -2;
	v_speed = 0;
	
	sprite_index = launchSprite;
	action = "launched";
	alarm[0] = 0;
	alarm[2] = 0; // Land alarm
	alarm[3] = 0; // Hitbox alarm
	
	if(aerial){
		y -= 12;
	}
}
	
friction = 0;
HP = 0;