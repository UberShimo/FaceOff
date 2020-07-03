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
	 
		sprite_index = Katana_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Back
	else if(keyboard_check(global.P1_Backward) &&
	action = "none" && !blocking && !aerial && !ducking){
		x -= ms;
	
		sprite_index = Katana_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Katana_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Duck
	if(keyboard_check(global.P1_Down) && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Katana_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(keyboard_check_released(global.P1_Down) && ducking && action == "none"){
		ducking = false;
	 
		sprite_index = Katana_Stand_Spr;
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

		sprite_index = Katana_Jump_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
	}

	// Block
	if(keyboard_check(global.P1_Block) && 
	action = "none" && !aerial){
		blocking = true;
	
		if(keyboard_check(global.P1_Down)){
			sprite_index = Katana_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Katana_Block_Standing_Spr;
			mask_index = Stand_Hurtbox_Spr;
		}
	}
	else if(keyboard_check_released(global.P1_Block) &&
	action = "none" && !aerial){
		if(keyboard_check(global.P1_Down)){
			ducking = true;
			sprite_index = Katana_Duck_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			ducking = false;
			sprite_index = Katana_Stand_Spr;
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
		
			sprite_index = Katana_Au_Spr;
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
		
				sprite_index = Katana_Ad_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(keyboard_check(global.P1_Forward)){
				action = "Af";
		
				sprite_index = Katana_Af_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(keyboard_check(global.P1_Backward)){
				action = "Ab1";
		
				sprite_index = Katana_Ab_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_C;
			}
			else{
				action = "An1";
		
				sprite_index = Katana_An1_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
		}
	}
	else if(action == "none" && Sbuffer > 0){	
		blocking = false;
	
		// Aerial
		if(aerial && image_index > 2 && image_index < 6){
			action = "Into_Eagle";
		
			sprite_index = Katana_Au_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = 0;
			alarm[3] = 10;
		}
		// NOT Aerial is needed
		else if(!aerial){
			if(ducking){
				action = "Into_Tiger";
		
				sprite_index = Katana_Into_Tiger_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = 6;
			}
			else if(keyboard_check(global.P1_Forward)){
				action = "Into_Tiger";
		
				sprite_index = Katana_TigerDash_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms * 2;
				friction = 0.4;
				alarm[3] = 12;
			}
			else if(keyboard_check(global.P1_Backward)){
				action = "Into_Viper";
		
				sprite_index = Katana_Into_Viper_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				hspeed = -ms;
				alarm[3] = 6;
			}
			else{
				action = "Into_Eagle";
		
				sprite_index = Katana_Into_Eagle_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = 6;
			}
		}
	}
	
	// EAGLE
	if(action == "Eagle"){
		if(Abuffer > 0){
			if(keyboard_check(global.P1_Down)){
				action = "Eagle_Ad";
		
				sprite_index = Katana_Eagle_Ad_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = global.startUp_A;
			}
			else if(keyboard_check(global.P1_Backward)){
				action = "Eagle_Ab";
		
				sprite_index = Katana_Eagle_Ab_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = global.startUp_B;
			}
			else{
				action = "Eagle_A";
		
				sprite_index = Katana_Eagle_A_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
		}
		else if(keyboard_check_pressed(global.P1_Special)){
			if(keyboard_check(global.P1_Down)){
				action = "Into_Tiger";
		
				sprite_index = Katana_Into_Tiger_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = 6;
			}
			else if(keyboard_check(global.P1_Forward)){
				action = "Into_Tiger";
		
				sprite_index = Katana_TigerDash_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms * 2;
				friction = 0.4;
				alarm[3] = 12;
			}
			else if(keyboard_check(global.P1_Backward)){
				action = "Into_Viper";
		
				sprite_index = Katana_Into_Viper_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				hspeed = -ms;
				alarm[3] = 6;
			}
		}
		else if(keyboard_check(global.P1_Block)){
			action = "StanceCancel";
			
			sprite_index = Katana_Into_Eagle_Spr;
			image_index = 2;
			image_speed = -0.5;
			alarm[0] = 6;
		}
	}
	
	// VIPER
	if(action == "Viper"){
		if(Abuffer > 0){
			if(keyboard_check(global.P1_Down)){
				action = "Viper_Ad1";
		
				sprite_index = Katana_Viper_Ad_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms;
				alarm[3] = global.startUp_A;
			}
			else if(keyboard_check(global.P1_Backward)){
				action = "Viper_Ab";
		
				sprite_index = Katana_Viper_Ab_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = global.startUp_B;
			}
			else{
				action = "Viper_A";
		
				sprite_index = Katana_Viper_A_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
		}
		else if(keyboard_check_pressed(global.P1_Special)){
			if(keyboard_check(global.P1_Down)){
				action = "Into_Tiger";
		
				sprite_index = Katana_Into_Tiger_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = 6;
			}
			else if(keyboard_check(global.P1_Forward)){
				action = "Into_Tiger";
		
				sprite_index = Katana_TigerDash_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms * 2;
				friction = 0.4;
				alarm[3] = 12;
			}
			else if(!keyboard_check(global.P1_Backward)){
				action = "Into_Eagle";
		
				sprite_index = Katana_Into_Eagle_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = 6;
			}
		}
		else if(keyboard_check(global.P1_Block)){
			action = "StanceCancel";
			
			sprite_index = Katana_Into_Viper_Spr;
			image_index = 2;
			image_speed = -0.5;
			alarm[0] = 6;
		}
	}
	
	// TIGER
	if(action == "Tiger"){
		if(Abuffer > 0){
			if(keyboard_check(global.P1_Down)){
				action = "Tiger_Ad";
		
				sprite_index = Katana_Tiger_Ad_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(keyboard_check(global.P1_Backward)){
				action = "Tiger_Ab";
		
				sprite_index = Katana_Tiger_Ab_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = global.startUp_A;
			}
			else{
				action = "Tiger_A";
		
				sprite_index = Katana_Tiger_A_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
		}
		else if(keyboard_check_pressed(global.P1_Special)){
			if(keyboard_check(global.P1_Forward)){
				action = "Into_Tiger";
		
				sprite_index = Katana_TigerDash_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms * 2;
				friction = 0.4;
				alarm[3] = 12;
			}
			else if(keyboard_check(global.P1_Backward)){
				action = "Into_Viper";
		
				sprite_index = Katana_Into_Viper_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				hspeed = -ms;
				alarm[3] = 6;
			}
			else if(!keyboard_check(global.P1_Down)){
				action = "Into_Eagle";
		
				sprite_index = Katana_Into_Eagle_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = 6;
			}
		}
		else if(keyboard_check(global.P1_Block)){
			action = "StanceCancel";
			
			sprite_index = Katana_Into_Tiger_Spr;
			image_index = 2;
			image_speed = -0.5;
			alarm[0] = 6;
		}
	}

	if(action == "An1" && image_index == 13 && Abuffer > 0){
		action = "An2";
		
		sprite_index = Katana_An2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = 1;
	}
	else if(action == "An1" && image_index == 12 && Sbuffer > 0){
		action = "Into_Tiger";

		alarm[0] = 0;
		alarm[3] = 1;
	}
	

	// An cancel
	if(action == "An1" && image_index < 2){
		if(keyboard_check(global.P1_Block)){
			action = "none";
		}
		else if(keyboard_check(global.P1_Forward)){
			action = "Af";
		
			sprite_index = Katana_Af_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_B;
		}
		else if(keyboard_check(global.P1_Backward)){
			action = "Ab1";
		
			sprite_index = Katana_Ab_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_C;
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