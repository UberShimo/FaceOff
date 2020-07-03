// Inherit the parent event
event_inherited();

if(global.duelHasStarted){
	// CONTROLS

	// Forward
	if(keyboard_check(global.P2_Forward) &&
	action = "none" && !blocking && !aerial && !ducking){
		if(x > Player1_Obj.x +10){
			x += ms;
		}
	 
		sprite_index = Rapier_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Back
	else if(keyboard_check(global.P2_Backward) &&
	action = "none" && !blocking && !aerial && !ducking){
		x -= ms;
	
		sprite_index = Rapier_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Rapier_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Duck
	if(keyboard_check(global.P2_Down) && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Rapier_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(keyboard_check_released(global.P2_Down) && ducking && action == "none"){
		ducking = false;
	 
		sprite_index = Rapier_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Jump
	if(keyboard_check(global.P2_Up) && action = "none" && !ducking && !aerial){
		if(keyboard_check(global.P2_Forward)){
			hspeed = ms;
		}
		else if(keyboard_check(global.P2_Backward)){
			hspeed = -ms;
		}
	
		aerial = true;
		blocking = false;

		sprite_index = Rapier_Jump_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
	}

	// Block
	if(keyboard_check(global.P2_Block) && 
	action = "none" && !aerial){
		blocking = true;
	
		if(keyboard_check(global.P2_Down)){
			sprite_index = Rapier_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Rapier_Block_Standing_Spr;
			mask_index = Stand_Hurtbox_Spr;
		}
	}
	else if(keyboard_check_released(global.P2_Block) &&
	action = "none" && !aerial){
		if(keyboard_check(global.P2_Down)){
			ducking = true;
			sprite_index = Rapier_Duck_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			ducking = false;
			sprite_index = Rapier_Stand_Spr;
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
			else if(keyboard_check(global.P2_Forward)){
				action = "Af";
		
				sprite_index = Rapier_Af_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(keyboard_check(global.P2_Backward)){
				action = "Ab";
		
				sprite_index = Rapier_Ab_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				hspeed = -ms;
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
	else if(action = "none" && Sbuffer > 0){	
		blocking = false;
	
		// Aerial
		if(aerial && image_index > 2 && image_index < 6){
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
				alarm[3] = global.startUp_B;
			}
			else if(keyboard_check(global.P2_Forward)){
				action = "Sf";
		
				sprite_index = Rapier_Sf_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(keyboard_check(global.P2_Backward)){
				action = "Sb1";
		
				sprite_index = Rapier_Sb_Spr;
				mask_index = Duck_Hurtbox_Spr;
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

	if(action == "An1" && Abuffer > 0 && image_index == 13){
		action = "An2";
		
		sprite_index = Rapier_An2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = 1;
	}
	
	// An cancel
	if(action == "An1" && image_index < 2){
		if(keyboard_check(global.P2_Block)){
			action = "none";
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