// Inherit the parent event
event_inherited();

if(global.duelHasStarted){
	// CONTROLS

	// Forward
	if(Forward_Check &&
	action = "none" && !blocking && !aerial && !ducking){
		if(x > Player1_Obj.x +10){
			x += ms - 0.5;
		}
	 
		sprite_index = Knives_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Back
	else if(Backward_Check &&
	action = "none" && !blocking && !aerial && !ducking){
		x -= ms;
	
		sprite_index = Knives_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Knives_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}

	// Duck
	if(Down_Check && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Knives_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(Down_Released && ducking && action == "none"){
		ducking = false;
	 
		sprite_index = Knives_Stand_Spr;
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

		sprite_index = Knives_Jump_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
	}

	// Block
	if(Block_Check && 
	action = "none" && !aerial){
		blocking = true;
	
		if(Down_Check){
			sprite_index = Knives_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Knives_Block_Standing_Spr;
			mask_index = Stand_Hurtbox_Spr;
		}
	}
	else if(Block_Released &&
	action = "none" && !aerial){
		if(Down_Check){
			ducking = true;
			sprite_index = Knives_Duck_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			ducking = false;
			sprite_index = Knives_Stand_Spr;
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
		
			sprite_index = Knives_Au_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[2] = 10;
			alarm[3] = global.startUp_A;
		}
		// NOT Aerial is needed
		else if(!aerial){
			if(ducking){
				action = "Ad1";
		
				sprite_index = Knives_Ad1_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Forward_Check){
				action = "Af";
		
				sprite_index = Knives_Af_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Backward_Check){
				action = "Ab1";
		
				sprite_index = Knives_Ab_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[3] = global.startUp_B;
			}
			else{
				action = "An1";
		
				sprite_index = Knives_An1_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
		}
	}
	else if(action = "none" && Sbuffer > 0 && alarm[5] < 100){	
		blocking = false;
	
		// Aerial
		if(aerial && image_index > 3 && image_index < 6){
			action = "Su1";
		
			sprite_index = Knives_Su_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[2] = 40;
			alarm[3] = global.startUp_B;
		}
		// NOT Aerial is needed
		else if(!aerial){
			if(ducking){
				action = "Sd1";
		
				sprite_index = Knives_Sd_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Forward_Check){
				if(hasTeleport){
					action = "Sf";
					hasTeleport = false;
		
					eff = instance_create_depth(x, y, -1, Knives_Sf_Eff);
					eff.image_xscale = -1;
					
					alarm[3] = 1;
					alarm[5] = 120;
				}
			}
			else if(Backward_Check){
				if(hasTeleport){
					action = "Sb";
					hasTeleport = false;
		
					eff = instance_create_depth(x, y, -1, Knives_Sb_Eff);
					eff.image_xscale = -1;
					
					alarm[3] = 1;
					alarm[5] = 120;
				}
			}
			else{
				action = "Sn";
		
				sprite_index = Knives_Sn_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
		}
	}

	if(action == "An1" && Abuffer > 0 && image_index == 13){
			action = "An2";
		
			sprite_index = Knives_An2_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2; 
			alarm[3] = 1;
	}
	else if(action == "An2" && Abuffer > 0 && image_index == 7){
			action = "An3";
		
			sprite_index = Knives_An3_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2; 
			alarm[3] = 1;
	}
	else if(action == "Ad1" && Abuffer > 0 && image_index == 13){
			action = "Ad2";
		
			sprite_index = Knives_Ad2_Spr;
			mask_index = Stand_Hurtbox_Spr;
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
		
			sprite_index = Knives_Af_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_A;
		}
		else if(Backward_Check){
			action = "Ab";
		
			sprite_index = Knives_Ab_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_B;
		}
	}
}

// Bleed spawning
if(Player1_Obj.bleed >= 100 && alarm[8] <= 0 && Player1_Obj.HP > 0){
	alarm[8] = 4;
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