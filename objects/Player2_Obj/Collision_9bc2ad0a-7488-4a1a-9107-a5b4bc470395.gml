if!(action = "launched"){
	h_speed = 2;
	vspeed = 0;
	gravity_direction = -90;
	gravity = global.gravityValue;
	
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