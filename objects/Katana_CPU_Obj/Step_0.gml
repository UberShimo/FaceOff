// Inherit the parent event
event_inherited();

if(global.duelHasStarted){
	// CONTROLS

	// Forward
	if(Forward &&
	action = "none" && !blocking && !aerial && !ducking){
		if(x > Player1_Obj.x +10){
			x += ms;
		}
	 
		sprite_index = Katana_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Back
	else if(Backward &&
	action = "none" && !blocking && !aerial && !ducking){
		x -= ms;
		
		// CPU check
		if(place_meeting(x+16, y, OutOfBounds_Obj)){
			Backward = false;
		}
	
		sprite_index = Katana_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Katana_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Duck
	if(Down && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Katana_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(action == "none" && !aerial &&
	!Forward && !Backward){
		ducking = false;
	
		sprite_index = Katana_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	else if(action = "none" && !Down){
		ducking = false;
	}

	// Jump
	if(Up && action = "none" && !ducking && !aerial){
		if(Forward){
			hspeed = ms;
		}
		else if(Backward){
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
	if(Block && 
	action = "none" && !aerial){
		blocking = true;
	
		if(Down){
			sprite_index = Katana_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Katana_Block_Standing_Spr;
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
			else if(Forward){
				action = "Af";
		
				sprite_index = Katana_Af_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Backward){
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
	else if(action == "none" && Special){	
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
			if(ducking){
				action = "Into_Tiger";
		
				sprite_index = Katana_Into_Tiger_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = 6;
			}
			else if(Forward){
				action = "Into_Tiger";
		
				sprite_index = Katana_TigerDash_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms * 2;
				friction = 0.4;
				alarm[3] = 12;
			}
			else if(Backward){
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
		if(Attack){
			if(Down){
				action = "Eagle_Ad";
		
				sprite_index = Katana_Eagle_Ad_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = global.startUp_A;
			}
			else if(Backward){
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
		else if(Special){
			if(Down){
				action = "Into_Tiger";
		
				sprite_index = Katana_Into_Tiger_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = 6;
			}
			else if(Forward){
				action = "Into_Tiger";
		
				sprite_index = Katana_TigerDash_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms * 2;
				friction = 0.4;
				alarm[3] = 12;
			}
			else if(Backward){
				action = "Into_Viper";
		
				sprite_index = Katana_Into_Viper_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				hspeed = -ms;
				alarm[3] = 6;
			}
		}
		else if(Block){
			action = "StanceCancel";
			
			sprite_index = Katana_Into_Eagle_Spr;
			image_index = 2;
			image_speed = -0.5;
			alarm[0] = 6;
		}
	}
	
	// VIPER
	if(action == "Viper"){
		if(Attack){
			if(Down){
				action = "Viper_Ad1";
		
				sprite_index = Katana_Viper_Ad_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms;
				alarm[3] = global.startUp_A;
			}
			else if(Backward){
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
		else if(Special){
			if(Down){
				action = "Into_Tiger";
		
				sprite_index = Katana_Into_Tiger_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = 6;
			}
			else if(Forward){
				action = "Into_Tiger";
		
				sprite_index = Katana_TigerDash_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms * 2;
				friction = 0.4;
				alarm[3] = 12;
			}
			else if(!Backward){
				action = "Into_Eagle";
		
				sprite_index = Katana_Into_Eagle_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = 6;
			}
		}
		else if(Block){
			action = "StanceCancel";
			
			sprite_index = Katana_Into_Viper_Spr;
			image_index = 2;
			image_speed = -0.5;
			alarm[0] = 6;
		}
	}
	
	// TIGER
	if(action == "Tiger"){
		if(Attack){
			if(Down){
				action = "Tiger_Ad";
		
				sprite_index = Katana_Tiger_Ad_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(Backward){
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
		else if(Special){
			if(Forward){
				action = "Into_Tiger";
		
				sprite_index = Katana_TigerDash_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				hspeed = ms * 2;
				friction = 0.4;
				alarm[3] = 12;
			}
			else if(Backward){
				action = "Into_Viper";
		
				sprite_index = Katana_Into_Viper_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				hspeed = -ms;
				alarm[3] = 6;
			}
			else if(!Down){
				action = "Into_Eagle";
		
				sprite_index = Katana_Into_Eagle_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = 6;
			}
		}
		else if(Block){
			action = "StanceCancel";
			
			sprite_index = Katana_Into_Tiger_Spr;
			image_index = 2;
			image_speed = -0.5;
			alarm[0] = 6;
		}
	}

	if(action == "An1" && image_index == 13 && Attack){
		action = "An2";
		
		sprite_index = Katana_An2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = 1;
	}
	else if(action == "An1" && image_index == 12 && Special){
		action = "Into_Tiger";

		alarm[0] = 0;
		alarm[3] = 1;
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