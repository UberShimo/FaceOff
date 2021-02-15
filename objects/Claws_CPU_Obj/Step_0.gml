// Inherit the parent event
event_inherited();


if(global.duelHasStarted){
	// CONTROLS

	// Forward
	if(Forward &&
	action = "none" && !blocking && !aerial && !ducking){
		if(x > Player1_Obj.x +11){
			x += ms * global.worldSpeed;
		}
	 
		sprite_index = Claws_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
		if(image_index >= 5 && image_index < 5.5){
			hitbox = instance_create_depth(x, y, 0, Claws_Run_Hitbox_Obj);
			hitbox.spawner = "P2";
			hitbox.image_xscale = -1;
		}
	}
	// Back
	else if(Backward &&
	action = "none" && !blocking && !aerial && !ducking){
		x -= ms * global.worldSpeed;
		
		// CPU check
		if(place_meeting(x+16, y, OutOfBounds_Obj)){
			Backward = false;
		}
	
		sprite_index = Claws_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Claws_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Limbo walk Forward
	else if(Forward &&
	action = "none" && !blocking && !aerial && x > Player1_Obj.x +10){
		x += (ms * 0.5) * global.worldSpeed;
	 
		sprite_index = Claws_Duck_Move_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	// Limbo walk Back
	else if(Backward &&
	action = "none" && !blocking && !aerial){
		x -= (ms * 0.5) * global.worldSpeed;
	 
		sprite_index = Claws_Duck_Move_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	// Limbo Nothing
	else if(action = "none" && !aerial){
		sprite_index = Claws_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}

	// Duck
	if(Down && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Claws_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(action == "none" && !aerial &&
	!Forward && !Backward){
		ducking = false;
	
		sprite_index = Claws_Stand_Spr;
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

		sprite_index = Claws_Jump_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
	}

	// Block
	if(Block && 
	action = "none" && !aerial){
		blocking = true;
	
		if(Down){
			sprite_index = Claws_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Claws_Block_Standing_Spr;
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
			h_speed = ms;
		
			sprite_index = Claws_Au_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_A;
		}
		// NOT Aerial is needed
		else if(!aerial){
			if(ducking){
				action = "Ad";
		
				sprite_index = Claws_Ad_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Forward){
				action = "Af1";
		
				sprite_index = Claws_Af1_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Backward){
				action = "Ab";
		
				sprite_index = Claws_Ab_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_C;
			}
			else{
				action = "An1";
		
				sprite_index = Claws_An1_Spr;
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
		
			sprite_index = Claws_Su_Spr;
			mask_index = Jump_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[2] = global.startUp_B;
			alarm[3] = global.startUp_B;
		}
		// NOT Aerial is needed
		else if(!aerial){
			if(ducking){
				action = "Sd1";
		
				sprite_index = Claws_Sd_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(Forward){
				action = "Sf";
				aerial = true;
		
				sprite_index = Claws_Sf_Spr;
				mask_index = Jump_Hurtbox_Spr;
				image_index = 0;
				h_speed = ms;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(Backward){
				action = "Sb";
				h_speed = -ms * 3;
				friction = 0.5;
		
				sprite_index = Claws_Sb_Spr;
				mask_index = Duck_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = 12;
			}
			else{
				action = "Sn";
		
				sprite_index = Claws_Sn_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
		}
	}

	if(action == "An1" && Attack && image_index == 10){
		action = "An2";
		
		sprite_index = Claws_An2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = 1;
	}
	else if(action == "An2" && Attack && image_index == 5){
		action = "An3";
		
		sprite_index = Claws_An1_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 6;
		alarm[0] = 32;
		alarm[3] = 1;
	}
	else if(action == "An3" && Attack && image_index == 10){
		action = "An4";
		
		sprite_index = Claws_An2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = 1;
	}

	if(action == "Af1" && Attack && image_index == 12){
		action = "Af2";
		
		sprite_index = Claws_Af2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = 1;
	}

	if(action == "Sb" && Attack && image_index == 9){
		action = "Sb_then_A";
		h_speed = ms * 1.5;
		
		sprite_index = Claws_Sb_then_A_Spr;
		mask_index = Duck_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = global.startUp_A;
	}
}


// Fading eff
if(fading_away){
	if(image_alpha > 0.1){
		image_alpha -= 0.01;
	}
	else{
		image_alpha -= 0.002;
	}
	
	if(image_alpha <= 0){
		fading_away = false;
		fading_back = true;
	}
}
else if(fading_back){
	if(image_alpha > 0.1){
		image_alpha += 0.01;
	}
	else{
		image_alpha += 0.002;
	}
	
	if(image_alpha >= 1){
		fading_back = false;
	}
}
