if(other.spawner = "P1"){
	if(determination && (action != "none" || action != "stunned") && !blocking){
		HP -= other.dmg;
	
		determination = false;
	
		if(HP <= 0){
			HP = 0;
			action = "dead";
			sprite_index = deadSprite;
			mask_index = Duck_Hurtbox_Spr;
			alarm[0] = 0;
			alarm[9] = (image_number * 2) -1;
		}
	}
	else {
		event_inherited();
	}
}