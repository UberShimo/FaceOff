/// @description hitbox etc

if(action == "An1"){
	hitbox = instance_create_depth(x, y, 0, Scythe_An1_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
if(action == "An2"){
	hitbox = instance_create_depth(x, y, 0, Scythe_An2_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Af"){
	hitbox1 = instance_create_depth(x, y, 0, Scythe_Af_tip_Hitbox_Obj);
	hitbox2 = instance_create_depth(x, y, 0, Scythe_Af_Hitbox_Obj);
	hitbox1.spawner = "P2";
	hitbox2.spawner = "P2";
	hitbox1.image_xscale = -1;
	hitbox2.image_xscale = -1;
	
	hspeed = 0;
}
else if(action == "Ab"){
	x -= 8;
	
	// Hitbox order is crucial for the attack to work correct.
	hitbox1 = instance_create_depth(x, y, 0, Scythe_Ab_tip_Hitbox_Obj);
	hitbox2 = instance_create_depth(x, y, 0, Scythe_Ab_Hitbox_Obj);
	hitbox1.spawner = "P2";
	hitbox2.spawner = "P2";
	hitbox1.image_xscale = -1;
	hitbox2.image_xscale = -1;
}
else if(action == "Ad1"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Ad1_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ad2"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Ad2_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Au"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Au_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Into_Hover";
	alarm[3] = 40;
}
else if(action == "Sn"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Sn_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	instance_create_depth(x, y, 0, Scythe_Blast_Obj);
}
else if(action == "Sf"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Sf_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Sf_Hurts";
	alarm[3] = 32;
}
else if(action == "Sf_Hurts"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Sf_SelfDMG_Hitbox_Obj);
	hitbox.spawner = "P1";
	hitbox.image_xscale = -1;
}
else if(action == "Sb"){
	instance_create_depth(x, y, 0, Scythe_Bird_P2_Obj);
}
else if(action == "Sd"){
	if(Forward){
		instance_create_depth(Player1_Obj.x - 14, Player2_Obj.y, -4, Scythe_AssScratcher_P2_Obj);
	}
	else if(Backward){
		instance_create_depth(Player1_Obj.x + 26, Player2_Obj.y, -4, Scythe_AssScratcher_P2_Obj);
	}
	else{
		instance_create_depth(Player1_Obj.x + 6, Player2_Obj.y, -4, Scythe_AssScratcher_P2_Obj);
	}
}
else if(action == "Su"){
	hitbox = instance_create_depth(x, y, 0, Scythe_Su_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Into_Hover";
	alarm[3] = 24;
}
else if(action == "Into_Hover"){
	action = "Hover";
	
	sprite_index = Scythe_Hover_Spr;
}

// Inherit Anti cross up
event_inherited();