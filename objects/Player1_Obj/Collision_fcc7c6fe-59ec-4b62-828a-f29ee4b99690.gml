h_speed = 0;
v_speed = 0;
aerial = false;

if(HP > 0){
	action = "rising";
	sprite_index = riseSprite;
	image_index = 0;
	alarm[0] = image_number * 2;
}
// DEAD
else{
	HP = 0;
	action = "dead";
	sprite_index = deadSprite;
	mask_index = Duck_Hurtbox_Spr;
	alarm[0] = 0;
	alarm[9] = 8;
}

move_contact_solid(-90, -1);