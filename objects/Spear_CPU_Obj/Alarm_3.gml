/// @description hitbox etc

if(action == "An1"){
	hitbox = instance_create_depth(x, y, 0, Spear_An1_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "An2"){
	x -= 6;
	
	hitbox = instance_create_depth(x, y, 0, Spear_An2_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Af"){
	hitbox = instance_create_depth(x, y, 0, Spear_Af_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ab"){
	hitbox = instance_create_depth(x, y, 0, Spear_Ab_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ad"){
	hitbox = instance_create_depth(x, y, 0, Spear_Ad_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Au"){
	hitbox = instance_create_depth(x, y, 0, Spear_Au_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	mask_index = Stand_Hurtbox_Spr;
}
else if(action == "Sn_start"){
	if(charges > 0){
		action = "Sn_hit";
		charges -= 1;
	
		sprite_index = Spear_Sn_start_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[3] = 4;
	}
	else{
		sprite_index = Spear_Sn_recover_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[0] = 16;
	}
}
else if(action == "Sn_hit"){
	x -= 4;
	
	if(Down){
		sprite_index = Spear_Sn_L_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[3] = 8;
		
		hitbox = instance_create_depth(x, y, 0, Spear_Sn_L_Hitbox_Obj);
		hitbox.spawner = "P2";
		hitbox.image_xscale = -1;
		
	}
	else {
		sprite_index = Spear_Sn_D_Spr;
		mask_index = Stand_Hurtbox_Spr;
		image_index = 0;
		alarm[3] = 8;
		
		hitbox = instance_create_depth(x, y, 0, Spear_Sn_D_Hitbox_Obj);
		hitbox.spawner = "P2";
		hitbox.image_xscale = -1;
	}
	
	action = "Sn_start";
}
else if(action == "Sf1"){
	hitbox = instance_create_depth(x, y, 0, Spear_Sf_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Sf2";
	alarm[3] = 16;
}
else if(action == "Sf2"){
	hitbox = instance_create_depth(x, y, 0, Spear_Sf_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Sf3";
	alarm[3] = 16;
}
else if(action == "Sf3"){
	hitbox = instance_create_depth(x, y, 0, Spear_Sf_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Sb"){
	h_speed = -ms;
	
	hitbox = instance_create_depth(x, y, 0, Spear_Sb_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	mask_index = Jump_Hurtbox_Spr;
	alarm[2] = 16;
}
else if(action == "Sd"){
	hitbox = instance_create_depth(x, y, 0, Spear_Sd_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Su"){
	hitbox = instance_create_depth(x, y, 0, Spear_Su_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Su_then_D"){
	hitbox = instance_create_depth(x, y, 0, Spear_Su_then_D_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	mask_index = Stand_Hurtbox_Spr;
}

// Inherit Anti cross up
event_inherited();