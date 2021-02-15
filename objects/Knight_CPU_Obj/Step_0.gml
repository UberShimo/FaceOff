// Inherit the parent event
event_inherited();

if(global.duelHasStarted){
	// CONTROLS

	// Forward
	if(Forward &&
	action = "none" && !blocking && !aerial && !ducking){
		if(x > Player1_Obj.x +10){
			x += ms * global.worldSpeed;
		}
	 
		sprite_index = Knight_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Back
	else if(Backward &&
	action = "none" && !blocking && !aerial && !ducking){
		x -= ms * global.worldSpeed;
		
		// CPU check
		if(place_meeting(x+16, y, OutOfBounds_Obj)){
			Backward = false;
		}
	
		sprite_index = Knight_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Knight_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Duck
	if(Down && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Knight_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(action == "none" && !aerial &&
	!Forward && !Backward){
		ducking = false;
	
		sprite_index = Knight_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	else if(action = "none" && !Down){
		ducking = false;
	}

	// Jump
	if(Up && action = "none" && !ducking && !aerial){
		if(Forward){
			h_speed = ms;
		}
		else if(Backward){
			h_speed = -ms;
		}
	
		aerial = true;
		blocking = false;

		sprite_index = Knight_Jump_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
	}

	// Block
	if(Block && 
	action = "none" && !aerial){
		blocking = true;
	
		if(Down){
			sprite_index = Knight_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Knight_Block_Standing_Spr;
			mask_index = Stand_Hurtbox_Spr;
		}
	}
	else{
		blocking = false;
	}


	// ACTION
	if(action = "none" && Attack){
		blocking = false;
	
		// Aerial
		if(aerial && image_index > 3 && image_index < 6){
			action = "Au";
		
			sprite_index = Knight_Au_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[2] = 10;
			alarm[3] = global.startUp_A;
		}
		// NOT Aerial is needed
		else if(!aerial){
			if(ducking){
				action = "Ad";
		
				sprite_index = Knight_Ad_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Forward){
				action = "Af";
		
				sprite_index = Knight_Af_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(Backward){
				action = "Ab";
		
				sprite_index = Knight_Ab_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_C;
			}
			else{
				action = "An1";
		
				sprite_index = Knight_An1_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
		}
	}
	else if(action = "none" && Special){	
		blocking = false;
	
		// Aerial
		if(aerial && image_index > 3 && image_index < 6){
			action = "Su1";
		
			sprite_index = Knight_Su_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[2] = 16;
			alarm[3] = global.startUp_B;
		}
		// NOT Aerial is needed
		else if(!aerial){
			if(ducking){
				action = "Sd";
		
				blocking = true;
				sprite_index = Knight_Sd_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(Forward){
				action = "Sf1";
		
				sprite_index = Knight_Sf_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_C;
			}
			else if(Backward){
				action = "Sb";
		
				sprite_index = Knight_Sb_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_C;
			}
			else{
				action = "Sn";
		
				blocking = true;
				sprite_index = Knight_Sn_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
		}
	}

	if(action == "An1" && Attack && image_index == 13){
			action = "An2";
		
			sprite_index = Knight_An2_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = 1;
	}

	if((action == "Af" || action = "Af_then_d")
	&& image_index < 8 && x > Player1_Obj.x +10){
		x += ms * 1;
	}

	if(action == "Af" && Down && image_index == 3){
		action = "Af_then_d";
	
		sprite_index = Knight_Af_then_d_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 3;
	}
}

// Determination eff
if(determination){
	if(aerial){
		instance_create_depth(x, y-12, 5, Determination_Eff_Obj);
	}
	else{
		instance_create_depth(x, y, 5, Determination_Eff_Obj);
	}
}
