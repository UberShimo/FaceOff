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
	 
		sprite_index = Spear_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Back
	else if(keyboard_check(global.P1_Backward) &&
	action = "none" && !blocking && !aerial && !ducking){
		x -= ms;
	
		sprite_index = Spear_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Spear_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Duck
	if(keyboard_check(global.P1_Down) && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Spear_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(keyboard_check_released(global.P1_Down) && ducking && action == "none"){
		ducking = false;
	 
		sprite_index = Spear_Stand_Spr;
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

		sprite_index = Spear_Jump_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
	}

	// Block
	if(keyboard_check(global.P1_Block) && 
	action = "none" && !aerial){
		blocking = true;
	
		if(keyboard_check(global.P1_Down)){
			sprite_index = Spear_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Spear_Block_Standing_Spr;
			mask_index = Stand_Hurtbox_Spr;
		}
	}
	else if(keyboard_check_released(global.P1_Block) &&
	action = "none" && !aerial){
		if(keyboard_check(global.P1_Down)){
			ducking = true;
			sprite_index = Spear_Duck_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			ducking = false;
			sprite_index = Spear_Stand_Spr;
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
		
			sprite_index = Spear_Au_Spr;
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
		
				sprite_index = Spear_Ad_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(keyboard_check(global.P1_Forward)){
				action = "Af";
		
				sprite_index = Spear_Af_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(keyboard_check(global.P1_Backward)){
				action = "Ab";
		
				sprite_index = Spear_Ab_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else{
				action = "An1";
		
				sprite_index = Spear_An1_Spr;
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
			hspeed = 1;
		
			sprite_index = Spear_Su_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[2] = 24;
			alarm[3] = global.startUp_C;
		}
		// NOT Aerial is needed
		else if(!aerial){
			if(ducking){
				action = "Sd";
		
				sprite_index = Spear_Sd_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(keyboard_check(global.P1_Forward)){
				action = "Sf1";
		
				sprite_index = Spear_Sf_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(keyboard_check(global.P1_Backward)){
				action = "Sb";
		
				sprite_index = Spear_Sb_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else{
				action = "Sn_charge";
		
				charges = 0;
			
				sprite_index = Spear_Sn_charge_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
			}
		}
	}

	if(action == "An1" && Abuffer > 0 && image_index == 13){
			action = "An2";
		
			sprite_index = Spear_An2_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2; 
			alarm[3] = 4;
	}

	// Alarm has 1 frame delay so frame checking is 1 frame bf4 action ;)
	if(action == "Sn_charge" && (image_index == 11 ||
	image_index == 15 || image_index == 19 ||
	image_index == 23 || image_index == 27)){
		charges += 1;
	
		if(!keyboard_check(global.P1_Special) || charges == 5){
			action = "Sn_start";
			alarm[3] = 1;
		}
	}

	if(action == "Su" && image_index == 7 && Dbuffer > 0){
		action = "Su_then_D";
	
		sprite_index = Spear_Su_then_D_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = 12;
	}
	
	// An cancel
	if(action == "An1" && image_index < 2){
		if(keyboard_check(global.P1_Block)){
			action = "none";
		}
		else if(keyboard_check(global.P1_Forward)){
			action = "Af";
		
			sprite_index = Spear_Af_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_A;
		}
		else if(keyboard_check(global.P1_Backward)){
			action = "Ab";
		
			sprite_index = Spear_Ab_Spr;
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