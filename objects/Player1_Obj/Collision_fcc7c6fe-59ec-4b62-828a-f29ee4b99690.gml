gravity = 0;
hspeed = 0;
vspeed = 0;

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
	alarm[9] = (image_number * 2) -1;
	gravity = 0;
	hspeed = 0;
	vspeed = 0;
}

move_contact_solid(-90, -1);