/// @description hitbox etc

if(action == "An1" || action == "An2"){
	hitbox = instance_create_depth(x, y, 0, Knight_An_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Af"){
	hitbox = instance_create_depth(x, y, 0, Knight_Af_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Af_then_d"){
	hitbox = instance_create_depth(x, y, 0, Knight_Af_then_d_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ab"){
	hitbox = instance_create_depth(x, y, 0, Knight_Ab_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ad"){
	hitbox = instance_create_depth(x, y, 0, Knight_Ad_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Au"){
	hitbox = instance_create_depth(x, y, 0, Knight_Au_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	mask_index = Stand_Hurtbox_Spr;
}

else if(action == "Sn"){
	hitbox = instance_create_depth(x, y, 0, Knight_Sn_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	blocking = false;
}
else if(action == "Sf1"){
	hitbox = instance_create_depth(x, y, 0, Knight_Sf1_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Sf2";
	hspeed = ms / 3;
	alarm[3] = 16;
}
else if(action == "Sf2"){
	hitbox = instance_create_depth(x, y, 0, Knight_Sf2_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	hspeed = 0;
}
else if(action == "Sb"){
	determination = true;
}
else if(action == "Sd"){
	hitbox = instance_create_depth(x, y, 0, Knight_Sd_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	blocking = false;
}
else if(action == "Su1"){
	hitbox = instance_create_depth(x, y, 0, Knight_Su_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	mask_index = Duck_Hurtbox_Spr;
	action = "Su2";
	alarm[3] = 16;
}
else if(action == "Su2"){
	determination = true;
}