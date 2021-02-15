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
	 
		sprite_index = Rapier_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Back
	else if(Forward &&
	action = "none" && !blocking && !aerial && !ducking){
		x -= ms * global.worldSpeed;
		
		// CPU check
		if(place_meeting(x+16, y, OutOfBounds_Obj)){
			Backward = false;
		}
		
		sprite_index = Rapier_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Rapier_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Duck
	if(Down && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Rapier_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(action == "none" && !aerial &&
	!Forward && !Backward){
		ducking = false;
	
		sprite_index = Rapier_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	else if(action = "none" && !Down){
		ducking = false;
	}

	// Jump
	if(Up && action = "none" && !ducking && !aerial){
		if(Up){
			h_speed = ms;
		}
		else if(Backward){
			h_speed = -ms;
		}
	
		aerial = true;
		blocking = false;

		sprite_index = Rapier_Jump_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
	}

	// Block
	if(Block && 
	action = "none" && !aerial){
		blocking = true;
	
		if(Down){
			sprite_index = Rapier_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Rapier_Block_Standing_Spr;
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
		
			sprite_index = Rapier_Au_Spr;
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
		
				sprite_index = Rapier_Ad_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Forward){
				action = "Af";
		
				sprite_index = Rapier_Af_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Backward){
				action = "Ab";
		
				sprite_index = Rapier_Ab_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				h_speed = -ms;
				alarm[0] = image_number * 2;
				alarm[2] = 10;
				alarm[3] = global.startUp_C;
			}
			else{
				action = "An1";
		
				sprite_index = Rapier_An1_Spr;
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
		
			sprite_index = Rapier_Su_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[2] = 10;
			alarm[3] = global.startUp_A;
		}
		// NOT Aerial is needed
		else if(!aerial){
			if(ducking){
				action = "Sd";
		
				sprite_index = Rapier_Sd_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Forward){
				action = "Sf";
		
				sprite_index = Rapier_Sf_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Backward){
				action = "Sb1";
		
				sprite_index = Rapier_Sb_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else{
				action = "Sn";
		
				sprite_index = Rapier_Sn_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_C;
			}
		}
	}

	if(action == "An1" && Attack && image_index == 13){
		action = "An2";
		
		sprite_index = Rapier_An2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = 1;
	}
}
