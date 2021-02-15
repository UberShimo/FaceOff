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
	 
		sprite_index = Mace_Move_F_Spr;
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
	
		sprite_index = Mace_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Mace_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Duck
	if(Down && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Mace_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(action == "none" && !aerial &&
	!Forward && !Backward){
		ducking = false;
	
		sprite_index = Mace_Stand_Spr;
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

		sprite_index = Mace_Jump_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
	}

	// Block
	if(Block && 
	action = "none" && !aerial){
		blocking = true;
	
		if(Down){
			sprite_index = Mace_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Mace_Block_Standing_Spr;
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
		
			sprite_index = Mace_Au_Spr;
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
		
				sprite_index = Mace_Ad_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Forward){
				action = "Af1";
		
				sprite_index = Mace_Af1_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(Backward){
				action = "Ab";
		
				sprite_index = Mace_Ab_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else{
				action = "An1";
		
				sprite_index = Mace_An1_Spr;
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
			action = "Su";
		
			sprite_index = Mace_Su_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[2] = 16;
			alarm[3] = global.startUp_B;
		}
		// NOT Aerial is needed
		else if(!aerial){
			if(ducking){
				action = "Sd_start";
		
				sprite_index = Mace_Sd_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = 6;
			}
			else if(Forward){
				action = "Sf";
		
				sprite_index = Mace_Sf_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_C;
			}
			else if(Backward){
				action = "Sb";
		
				sprite_index = Mace_Sb_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = 40;
			}
			else{
				action = "Sn_start";
		
				sprite_index = Mace_Sn_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = 6;
			}
		}
	}

	if(action == "An1" && Attack && image_index == 10){
		if(Down){
			action = "Af2";
		
			sprite_index = Mace_Af2_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_A;
		}
		else{
			action = "An2";
		
			sprite_index = Mace_An2_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2; 
			alarm[3] = global.startUp_A;
		}
	}
	if(action == "Af1" && Attack && image_index == 13){
		action = "Af2";
		
		sprite_index = Mace_Af2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
		alarm[3] = global.startUp_A;
	}
}
