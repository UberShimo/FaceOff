if(other.spawner = "P2"){
	if(parry_H && (other.type == "H" || other.type == "D")){
		action = "parry_H";
		
		sprite_index = Mace_Sn_Parry_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
		
		Player2_Obj.blocking = false;
		Player2_Obj.ducking = false;
		Player2_Obj.action = "stunned";
		Player2_Obj.mask_index = Stand_Hurtbox_Spr;
		Player2_Obj.alarm[0] = 50;
		
		alarm[3] = 4;
		parry_H = false;
	}
	else if(parry_L && (other.type == "L" || other.type == "A")){
		action = "parry_L";
		
		sprite_index = Mace_Sd_Parry_Spr;
		mask_index = Duck_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = image_number * 2;
		
		Player2_Obj.blocking = false;
		Player2_Obj.ducking = false;
		Player2_Obj.action = "stunned";
		Player2_Obj.mask_index = Stand_Hurtbox_Spr;
		Player2_Obj.alarm[0] = 50;
		
		alarm[3] = 4;
		parry_L = false;
	}
	else {
		event_inherited();
		parry_H = false;
		parry_L = false;
	}
}