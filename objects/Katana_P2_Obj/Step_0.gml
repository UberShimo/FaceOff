// Inherit the parent event
event_inherited();

if(global.duelHasStarted){
	// CONTROLS

	// Forward
	if(Forward_Check &&
	action = "none" && !blocking && !aerial && !ducking){
		if(x > Player1_Obj.x +10){
			x += ms;
		}
	 
		sprite_index = Katana_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Back
	else if(Backward_Check &&
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
	if(Down_Check && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Katana_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(Down_Released && ducking && action == "none"){
		ducking = false;
	 
		sprite_index = Katana_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Jump
	if(Up_Check && action = "none" && !ducking && !aerial){
		if(Forward_Check){
			hspeed = ms;
		}
		else if(Backward_Check){
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
	if(Block_Check && 
	action = "none" && !aerial){
		blocking = true;
	
		if(Down_Check){
			sprite_index = Katana_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Katana_Block_Standing_Spr;
			mask_index = Stand_Hurtbox_Spr;
		}
	}
	else if(Block_Released &&
	action = "none" && !aerial){
		if(Down_Check){
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
		if(aerial && image_index > 3 && image_index < 6){
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
			else if(Forward_Check){
				action = "Af";
		
				sprite_index = Katana_Af_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Backward_Check){
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
	// Stance switch
	else if((action == "none" || action == "Eagle" || action == "Viper" || action == "Tiger") && Special_Pressed){	
		blocking = false;
	
		// Aerial
		if(aerial && image_index > 3 && image_index < 6){
			action = "Into_Eagle";
		
			sprite_index = Katana_Au_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = 0;
			alarm[3] = 10;
		}
		// NOT Aerial is needed
		else if(!aerial){
			if(Down_Check){
				if(action != "Tiger"){
					action = "Into_Tiger";
		
					sprite_index = Katana_Into_Tiger_Spr;
					mask_index = Duck_Hurtbox_Spr;
					image_index = 0;
					alarm[3] = 6;
				}
			}
			else if(Forward_Check){
				action = "Into_Tiger";
		
				sprite_index = Katana_TigerDash_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms * 2;
				friction = 0.4;
				alarm[3] = 12;
			}
			else if(Backward_Check){
				if(action != "Viper"){
					action = "Into_Viper";
		
					sprite_index = Katana_Into_Viper_Spr;
					mask_index = Stand_Hurtbox_Spr;
					image_index = 0;
					hspeed = -ms;
					alarm[3] = 6;
				}
			}
			else if(action != "Eagle"){
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
			if(Down_Check){
				action = "Eagle_Ad";
		
				sprite_index = Katana_Eagle_Ad_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = global.startUp_A;
			}
			else if(Backward_Check){
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
		else if(Block_Check){
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
			if(Down_Check){
				action = "Viper_Ad1";
		
				sprite_index = Katana_Viper_Ad_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms;
				alarm[3] = global.startUp_A;
			}
			else if(Backward_Check){
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
		else if(Block_Check){
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
			if(Down_Check){
				action = "Tiger_Ad";
		
				sprite_index = Katana_Tiger_Ad_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(Backward_Check){
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
		else if(Block_Check){
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
		if(Block_Check){
			action = "none";
		}
		else if(Forward_Check){
			action = "Af";
		
			sprite_index = Katana_Af_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_B;
		}
		else if(Backward_Check){
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