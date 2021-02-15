// Inherit the parent event
event_inherited();

if(global.duelHasStarted){
	// CONTROLS

	// Forward
	if(Forward_Check &&
	action = "none" && !blocking && !aerial && !ducking){
		if(x > Player1_Obj.x +10){
			x += ms * global.worldSpeed;
		}
	 
		sprite_index = Scythe_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Back
	else if(Backward_Check &&
	action = "none" && !blocking && !aerial && !ducking){
		x -= ms * global.worldSpeed;
	
		sprite_index = Scythe_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Scythe_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Duck
	if(Down_Check && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Scythe_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(Down_Released && ducking && action == "none"){
		ducking = false;
	 
		sprite_index = Scythe_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Jump
	if(Up_Check && action = "none" && !ducking && !aerial){
		if(Forward_Check){
			h_speed = ms;
		}
		else if(Backward_Check){
			h_speed = -ms;
		}
	
		action = "Into_Hover";
		aerial = true;
		blocking = false;

		sprite_index = Scythe_Jump_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[3] = 8;
	}

	// Block
	if(Block_Check && 
	action = "none" && !aerial){
		blocking = true;
	
		if(Down_Check){
			sprite_index = Scythe_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Scythe_Block_Standing_Spr;
			mask_index = Stand_Hurtbox_Spr;
		}
	}
	else if(Block_Released &&
	action = "none" && !aerial){
		if(Down_Check){
			ducking = true;
			sprite_index = Scythe_Duck_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			ducking = false;
			sprite_index = Scythe_Stand_Spr;
			mask_index = Stand_Hurtbox_Spr;
		}
		blocking = false;
	}
	
	// Scythe HOVER
	if(action == "Hover"){
		sprite_index = Scythe_Hover_Spr;
		
		if(!Up_Check){
			action = "none";
			
			sprite_index = Scythe_Jump_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 4;
			alarm[0] = 8;
		}
		else if(Abuffer > 0){
			action = "Au";
		
			sprite_index = Scythe_Au_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[3] = global.startUp_B;
		}
		else if(Sbuffer > 0){
			action = "Su";
		
			sprite_index = Scythe_Su_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[3] = global.startUp_A;
		}
	}
	
	// Scythe AERIAL MOVEMENT
	if(aerial && action != "launched"){
		// Forward
		if(Forward_Check && h_speed > ms){
			h_speed -= 0.1;
		}
		// Back
		else if(Backward_Check && h_speed < -ms){
			h_speed += 0.1;
		}
	}


	// ACTION
	if(action = "none" && Abuffer > 0){
		blocking = false;
	
		// NOT Aerial is needed
		if(!aerial){
			if(ducking){
				action = "Ad1";
		
				sprite_index = Scythe_Ad1_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Forward_Check){
				action = "Af";
		
				h_speed = ms / 2;
				sprite_index = Scythe_Af_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_C;
			}
			else if(Backward_Check){
				action = "Ab";
		
				sprite_index = Scythe_Ab_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_C;
			}
			else{
				action = "An1";
		
				sprite_index = Scythe_An1_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
		}
	}
	else if(action = "none" && Sbuffer > 0){	
		blocking = false;
	
		// NOT Aerial is needed
		if(!aerial){
			if(ducking){
				action = "Sd";
		
				sprite_index = Scythe_Sd_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = 1;
			}
			else if(Forward_Check){
				action = "Sf";
		
				sprite_index = Scythe_Sf_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(Backward_Check){
				action = "Sb";
		
				sprite_index = Scythe_Sb_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(hasBlast){
				action = "Sn";
				hasBlast = false;
		
				sprite_index = Scythe_Sn_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = 1;
				alarm[5] = 240;
			}
		}
	}

	if(action == "An1" && Abuffer > 0 && image_index == 13){
			action = "An2";
		
			sprite_index = Scythe_An2_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2; 
			alarm[3] = 1;
	}
	
	if(action == "Ad1" && Abuffer > 0 && image_index == 13){
			action = "Ad2";
		
			sprite_index = Scythe_Ad2_Spr;
			mask_index = Duck_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2; 
			alarm[3] = 1;
	}
	
	// An cancel
	if(action == "An1" && image_index < 2){
		if(Block_Check){
			action = "none";
		}
		else if(Forward_Check){
			action = "Af";
		
			h_speed = ms / 2;
			sprite_index = Scythe_Af_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_C;
		}
		else if(Backward_Check){
			action = "Ab";
		
			sprite_index = Scythe_Ab_Spr;
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