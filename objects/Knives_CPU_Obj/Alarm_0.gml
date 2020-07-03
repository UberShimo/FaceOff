/// @description recover

if(aerial){
	action = "land"
	sprite_index = Knives_Stand_Spr;
	mask_index = Stand_Hurtbox_Spr;
	alarm[0] = 4;
	
	hspeed = 0;
	aerial = false;
}
else{
	if(Down){
		ducking = true;
		sprite_index = Knives_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else{
		ducking = false;
		sprite_index = Knives_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	
	hspeed = 0;
	blocking = false;
	action = "none";
}


