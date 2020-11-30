/// @description recover

if(aerial){
	action = "land"
	sprite_index = Claws_Stand_Spr;
	mask_index = Stand_Hurtbox_Spr;
	alarm[0] = 4;
	
	h_speed = 0;
	aerial = false;
}
else{
	if(Down){
		ducking = true;
		sprite_index = Claws_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else{
		ducking = false;
		sprite_index = Claws_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	
	h_speed = 0;
	friction = 0;
	blocking = false;
	action = "none";
}


