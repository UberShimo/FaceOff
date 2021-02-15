// Inherit the parent event
event_inherited();


if(global.duelHasStarted){
	// CONTROLS

	// Forward
	if(Forward_Check &&
	action = "none" && !blocking && !aerial && !ducking){
		if(x < Player2_Obj.x -11){
			x += ms * global.worldSpeed;
		}
	 
		sprite_index = Claws_Move_F_Spr;
		mask_index = Stand_Hurtbox_Spr;
		if(image_index >= 5 && image_index < 5.5){
			hitbox = instance_create_depth(x, y, 0, Claws_Run_Hitbox_Obj);
			hitbox.spawner = "P1";
		}
	}
	// Back
	else if(Backward_Check &&
	action = "none" && !blocking && !aerial && !ducking){
		x -= ms * global.worldSpeed;
	
		sprite_index = Claws_Move_B_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Nothing
	else if(action = "none" && !ducking && !aerial){
		sprite_index = Claws_Stand_Spr;
		mask_index = Stand_Hurtbox_Spr;
	}
	// Limbo walk Forward
	else if(Forward_Check &&
	action = "none" && !blocking && !aerial && x < Player2_Obj.x -10){
		x += (ms * 0.5) * global.worldSpeed;
	 
		sprite_index = Claws_Duck_Move_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	// Limbo walk Back
	else if(Backward_Check &&
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
	if(Down_Check && !ducking && action == "none" && !aerial){
		ducking = true;
	
		sprite_index = Claws_Duck_Spr;
		mask_index = Duck_Hurtbox_Spr;
	}
	else if(Down_Released && ducking && action == "none"){
		ducking = false;
	 
		sprite_index = Claws_Stand_Spr;
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
	
		aerial = true;
		blocking = false;

		sprite_index = Claws_Jump_Spr;
		mask_index = Jump_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
	}

	// Block
	if(Block_Check && 
	action = "none" && !aerial){
		blocking = true;
	
		if(Down_Check){
			sprite_index = Claws_Block_Ducking_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			sprite_index = Claws_Block_Standing_Spr;
			mask_index = Stand_Hurtbox_Spr;
		}
	}
	else if(Block_Released &&
	action = "none" && !aerial){
		if(Down_Check){
			ducking = true;
			sprite_index = Claws_Duck_Spr;
			mask_index = Duck_Hurtbox_Spr;
		}
		else{
			ducking = false;
			sprite_index = Claws_Stand_Spr;
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
			else if(Forward_Check){
				action = "Af1";
		
				sprite_index = Claws_Af1_Spr;
				mask_index = Stand_Hurtbox_Spr;
				image_index = 0;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_A;
			}
			else if(Backward_Check){
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
	else if(action = "none" && Sbuffer > 0){	
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
			else if(Forward_Check){
				action = "Sf";
				aerial = true;
		
				sprite_index = Claws_Sf_Spr;
				mask_index = Jump_Hurtbox_Spr;
				image_index = 0;
				h_speed = ms;
				alarm[0] = image_number * 2;
				alarm[3] = global.startUp_B;
			}
			else if(Backward_Check){
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

	if(action == "An1" && Abuffer > 0 && image_index == 10){
		action = "An2";
		
		sprite_index = Claws_An2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = 1;
	}
	else if(action == "An2" && Abuffer > 0 && image_index == 5){
		action = "An3";
		
		sprite_index = Claws_An1_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 6;
		alarm[0] = 32;
		alarm[3] = 1;
	}
	else if(action == "An3" && Abuffer > 0 && image_index == 10){
		action = "An4";
		
		sprite_index = Claws_An2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = 1;
	}

	if(action == "Af1" && Abuffer > 0 && image_index == 12){
		action = "Af2";
		
		sprite_index = Claws_Af2_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = 1;
	}

	if(action == "Sb" && Abuffer > 0 && image_index == 9){
		action = "Sb_then_A";
		h_speed = ms * 1.5;
		
		sprite_index = Claws_Sb_then_A_Spr;
		mask_index = Duck_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2; 
		alarm[3] = global.startUp_A;
	}
	
	// An cancel
	if(action == "An1" && image_index < 2){
		if(Block_Check){
			action = "none";
		}
		else if(Forward_Check){
			action = "Af1";
		
			sprite_index = Claws_Af1_Spr;
			mask_index = Stand_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_A;
		}
		else if(Backward_Check){
			action = "Ab";
		
			sprite_index = Claws_Ab_Spr;
			mask_index = Duck_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = image_number * 2;
			alarm[3] = global.startUp_C;
		}
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
