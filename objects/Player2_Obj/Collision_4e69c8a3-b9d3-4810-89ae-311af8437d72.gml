if(other.spawner = "P1" && action != "dead" && action != "rising"){
	friction = 0;
	hit = false; // Checks if you got properly hit!
	
	// Unblockable
	if(other.penetration == 1){
		HP -= other.dmg;
		
		// Small dmg should not stun
		if(other.hitStun > 0){
			action = "stunned";
			blocking = false;
			sprite_index = hitSprite;
			mask_index = Stand_Hurtbox_Spr;
			
			alarm[0] = other.hitStun;
			hspeed = other.hitPush;
			hit = true;
			audio_play_sound(Hit_snd, 3, false);
			
			if(other.type = "H"){
				instance_create_depth(x-4, y+8, -2, Hit_Eff_Obj);
			}
			else if(other.type = "L"){
				instance_create_depth(x-4, y+18, -2, Hit_Eff_Obj);
			}
			else if(other.type = "D"){
				instance_create_depth(x-4, y+8, -2, Hit_Eff_Obj);
			}
			else{
				instance_create_depth(x-4, y+12, -2, Hit_Eff_Obj);
			}
		}
	}
	// Ducking
	else if(ducking){
		if(blocking && other.type != "D"){
			HP -= other.dmg * other.penetration;
			guard -= other.guardDmg;
			action = "stunned";
			sprite_index = blockStunCrouchingSprite;
			mask_index = Duck_Hurtbox_Spr;
			
			alarm[0] = other.blockStun;
			hspeed = other.blockPush;
				
			instance_create_depth(x-4, y+18, -2, Block_Eff_Obj);
			audio_play_sound(Block_snd, 3, false);
		}
		else{
			HP -= other.dmg;
			
			// Small dmg should not stun
			if(other.hitStun > 0){
				action = "stunned";
				blocking = false;
				sprite_index = hitSprite;
				mask_index = Stand_Hurtbox_Spr;
			
				alarm[0] = other.hitStun;
				hspeed = other.hitPush;
			
				hit = true;
			}
			audio_play_sound(Hit_snd, 3, false);
			
			if(other.type = "H"){
				instance_create_depth(x-4, y+8, -2, Hit_Eff_Obj);
			}
			else if(other.type = "L"){
				instance_create_depth(x-4, y+18, -2, Hit_Eff_Obj);
			}
			else if(other.type = "D"){
				instance_create_depth(x-4, y+8, -2, Hit_Eff_Obj);
			}
			else{
				instance_create_depth(x-4, y+12, -2, Hit_Eff_Obj);
			}
		}
	}
	// Aerial
	else if(aerial){
		// Remove hitbox below if you do air attack
		if(other.type != "L"){
			HP -= other.dmg;
			
			// Small dmg should not stun
			if(other.hitStun > 0){
				action = "launched";
				blocking = false;
				sprite_index = hitSprite;
				mask_index = Stand_Hurtbox_Spr;
			
				alarm[0] = other.hitStun;
				hspeed = other.hitPush;
				
				hit = true;
			}
			audio_play_sound(Hit_snd, 3, false);
			
			instance_create_depth(x-4, y+8, -2, Hit_Eff_Obj);
		}
	}
	// Standing
	else{
		if(blocking && other.type != "L"){
			HP -= other.dmg * other.penetration;
			guard -= other.guardDmg;
			action = "stunned";
			sprite_index = blockStunStandingSprite;
			mask_index = Stand_Hurtbox_Spr;
			
			alarm[0] = other.blockStun;
			hspeed = other.blockPush;
			
			instance_create_depth(x-4, y+8, -2, Block_Eff_Obj);
			audio_play_sound(Block_snd, 3, false);
		}
		else{
			HP -= other.dmg;
			
			// Small dmg should not stun
			if(other.hitStun > 0){
				action = "stunned";
				blocking = false;
				sprite_index = hitSprite;
				mask_index = Stand_Hurtbox_Spr;
			
				alarm[0] = other.hitStun;
				hspeed = other.hitPush;
				
				hit = true;
			}
			audio_play_sound(Hit_snd, 3, false);
			
			if(other.type = "H"){
				instance_create_depth(x-4, y+8, -2, Hit_Eff_Obj);
			}
			else if(other.type = "L"){
				instance_create_depth(x-4, y+18, -2, Hit_Eff_Obj);
			}
			else if(other.type = "D"){
				instance_create_depth(x-4, y+8, -2, Hit_Eff_Obj);
			}
			else{
				instance_create_depth(x-4, y+12, -2, Hit_Eff_Obj);
			}
		}
	}
	// Launch logic
	if((hit && other.launcher) || action = "launched"){
		hspeed = other.hLaunch;
		vspeed = other.vLaunch;
		gravity_direction = -90;
		gravity = global.gravityValue;
		sprite_index = launchSprite;
		mask_index = Duck_Hurtbox_Spr;
		alarm[0] = 0;
		
		action = "launched";
	}
	
	// Interrupt hitbox outcome
	if(hit){
		alarm[3] = 0;
	}
	
	// Bleed logic (Knives relevant)
	if(other.bleed > 0 && hit){
		bleed += other.bleed;
		
		if(bleed > 100){
			bleed = 100;
		}
	}
	
	// Guard break
	if(guard <= 0){
		guard = 0;
		blocking = false;
		ducking = false;
		action = "stunned";
		sprite_index = guardBreakSprite;
		mask_index = Stand_Hurtbox_Spr;
		alarm[0] = 120;
	}

	// DEAD
	if(HP <= 0){
		HP = 0;
	
		if(!place_free(x, y+1)){
			action = "dead";
			sprite_index = deadSprite;
			mask_index = Duck_Hurtbox_Spr;
			image_index = 0;
			alarm[0] = 0;
			alarm[9] = (image_number * 2) -1;
			gravity = 0;
			hspeed = 0;
			vspeed = 0;
		}
	}
}
else if(action = "rising" && other.hitStun > 0){
	action = "stunned";
	sprite_index = hitSprite;
	mask_index = Stand_Hurtbox_Spr;
		
	alarm[0] = global.hitStun_C;
	hspeed = 2;
	
	audio_play_sound(Hit_snd, 3, false);
	instance_create_depth(x-4, y+12, -2, Hit_Eff_Obj);
}