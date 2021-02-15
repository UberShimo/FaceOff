/// @description hitbox etc

if(action == "An1"){
	hitbox = instance_create_depth(x, y, 0, Scythe_An1_Hitbox_Obj);
	hitbox.spawner = "P1";
}
if(action == "An2"){
	hitbox = instance_create_depth(x, y, 0, Scythe_An2_Hitbox_Obj);
	hitbox.spawner = "P1";
}
else if(action == "Af"){
	hitbox1 = instance_create_depth(x, y, 0, Scythe_Af_tip_Hitbox_Obj);
	hitbox2 = instance_create_depth(x, y, 0, Scythe_Af_Hitbox_Obj);
	hitbox1.spawner = "P1";
	hitbox2.spawner = "P1";
	
	h_speed = 0;
}
else if(action == "Ab"){
	x += 8;
	
	hitbox1 = instance_create_depth(x, y, 0, Scythe_Ab_tip_Hitbox_Obj);
	hitbox2 = instance_create_depth(x, y, 0, Scythe_Ab_Hitbox_Obj);
	hitbox1.spawner = "P1";
	hitbox2.spawner = "P1";
}
else if(action == "Ad1"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Ad1_Hitbox_Obj);
	hitbox.spawner = "P1";
}
else if(action == "Ad2"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Ad2_Hitbox_Obj);
	hitbox.spawner = "P1";
}
else if(action == "Au"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Au_Hitbox_Obj);
	hitbox.spawner = "P1";
	
	action = "Into_Hover";
	alarm[3] = 40;
}
else if(action == "Sn"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Sn_Hitbox_Obj);
	hitbox.spawner = "P1";
	
	instance_create_depth(x, y, 0, Scythe_Blast_Obj);
}
else if(action == "Sf"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Sf_Hitbox_Obj);
	hitbox.spawner = "P1";
	
	action = "Sf_Hurts";
	alarm[3] = 32;
}
else if(action == "Sf_Hurts"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Sf_SelfDMG_Hitbox_Obj);
	hitbox.spawner = "P2";
}
else if(action == "Sb"){
	instance_create_depth(x, y, 0, Scythe_Bird_P1_Obj);
}
else if(action == "Sd"){
	if(Forward_Check){
		instance_create_depth(Player2_Obj.x + 16, Player2_Obj.y, -4, Scythe_AssScratcher_P1_Obj);
	}
	else if(Backward_Check){
		instance_create_depth(Player2_Obj.x - 26, Player2_Obj.y, -4, Scythe_AssScratcher_P1_Obj);
	}
	else{
		instance_create_depth(Player2_Obj.x - 6, Player2_Obj.y, -4, Scythe_AssScratcher_P1_Obj);
	}
}
else if(action == "Su"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Su_Hitbox_Obj);
	hitbox.spawner = "P1";
	
	action = "Into_Hover";
	alarm[3] = 24;
}
else if(action == "Into_Hover"){
	action = "Hover";
	
	sprite_index = Scythe_Hover_Spr;
}

// Inherit Anti cross up
event_inherited();