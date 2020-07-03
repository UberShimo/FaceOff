/// @description recover

if(aerial){
	action = "land"
	sprite_index = Knight_Stand_Spr;
	mask_index = Stand_Hurtbox_Spr;
	alarm[0] = 4;
	
	hspeed = 0;
	aerial = false;
}
else{
	if(keyboard_check(global.P1_Down)){
		ducking = true;
		sprite_index = Knight_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else{
		ducking = false;
		sprite_index = Knight_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	
	hspeed = 0;
	blocking = false;
	action = "none";
}


