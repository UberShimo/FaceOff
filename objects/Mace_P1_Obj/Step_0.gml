// Inherit the parent event
event_inherited();

if(global.duelHasStarted){
	// CONTROLS

	// Forward
	if(keyboard_check(global.P1_Forward) &&
	action = "none" && !blocking && !aerial && !ducking){
		if(x < Player2_Obj.x -10){
			x += ms;
		}
	 
		sprite_index = Mace_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Back
	else if(keyboard_check(global.P1_Backward) &&
	action = "none" && !blocking && !aerial && !ducking){
		x -= ms;
	
		sprite_index = Mace_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Mace_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Duck
	if(keyboard_check(global.P1_Down) && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Mace_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(keyboard_check_released(global.P1_Down) && ducking && action == "none"){
		ducking = false;
	 
		sprite_index = Mace_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Jump
	if(keyboard_check(global.P1_Up) && action = "none" && !ducking && !aerial){
		if(keyboard_check(global.P1_Forward)){
			hspeed = ms;
		}
		else if(keyboard_check(global.P1_Backward)){
			hspeed = -ms;
		}
	
		aerial = true;
		blocking = false;

		sprite_index = Mace_Jump_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
	}

	// Block
	if(keyboard_check(global.P1_Block) && 
	action = "none" && !aerial){
		blocking = true;
	
		if(keyboard_check(global.P1_Down)){
			sprite_index = Mace_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Mace_Block_Standing_Spr;
			mask_index = Stand_Hurtbox_Spr;
		}
	}
	else if(keyboard_check_released(global.P1_Block) &&
	action = "none" && !aerial){
		if(keyboard_check(global.P1_Down)){
			ducking = true;
			sprite_index = Mace_Duck_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			ducking = false;
			sprite_index = Mace_Stand_Spr;
			mask_index = Stand_Hurtbox_Spr;
		}
		blocking = false;
	}


	// ACTION
	if(action = "none" && Abuffer > 0){
		blocking = false;
	
		// Aerial
		if(aerial && image_index > 2 && image_index < 6){
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
			else if(keyboard_check(global.P1_Forward)){
				action = "Af1";
		
				sprite_index = Mace_Af1_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(keyboard_check(global.P1_Backward)){
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
	else if(action = "none" && Sbuffer > 0){	
		blocking = false;
	
		// Aerial
		if(aerial && image_index > 2 && image_index < 6){
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
			else if(keyboard_check(global.P1_Forward)){
				action = "Sf";
		
				sprite_index = Mace_Sf_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_C;
			}
			else if(keyboard_check(global.P1_Backward)){
				action = "Sb";
		
				sprite_index = Mace_Sb_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = 32;
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

	if(action == "An1" && Abuffer > 0 && image_index == 10){
		if(keyboard_check(global.P1_Down)){
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
	if(action == "Af1" && Abuffer > 0 && image_index == 13){
		action = "Af2";
		
		sprite_index = Mace_Af2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
		alarm[3] = global.startUp_A;
	}
	
	// An cancel
	if(action == "An1" && image_index < 2){
		if(keyboard_check(global.P1_Block)){
			action = "none";
		}
		else if(keyboard_check(global.P1_Forward)){
			action = "Af1";
		
			sprite_index = Mace_Af1_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_B;
		}
		else if(keyboard_check(global.P1_Backward)){
			action = "Ab";
		
			sprite_index = Mace_Ab_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_B;
		}
	}
}


// Guard recoverer
if(guard < maxGuard){
	if(blocking){
		guard += 0.1;
	}
	else{
		guard += 0.5;
	}
}