/// @description hitbox etc

if(action == "An1" || action == "An2"){
	x -= 4;
	
	hitbox = instance_create_depth(x, y, 0, Knives_An_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "An3"){
	x -= 4;
	
	hitbox = instance_create_depth(x, y, 0, Knives_An3_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Af"){
	x -= 32;
	
	hitbox = instance_create_depth(x, y, 0, Knives_Af_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ab1"){
	x -= 8;
	
	hitbox = instance_create_depth(x, y, 0, Knives_Ab_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Ab2";
	aerial = true;
	mask_index = Jump_Hurtbox_Spr;
	alarm[3] = 24;
}
else if(action == "Ab2"){
	sprite_index = Knives_Jump_Spr;
	image_index = 3;
	alarm[0] = (image_number * 2) - 6;
	
	action = "none";
}
else if(action == "Ad1" || action == "Ad2"){
	hitbox = instance_create_depth(x, y, 0, Knives_Ad_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Au"){
	hitbox = instance_create_depth(x, y, 0, Knives_Au_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Sn"){
	hitbox = instance_create_depth(x, y, 0, Knives_Sn_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
// No Sf or Sb to be found here

else if(action == "Sd1"){
	x -= 6;
	
	hitbox = instance_create_depth(x, y, 0, Knives_Sd_Hitbox_Obj);
	hitbox.spawner = "P2";
	
	action = "Sd2";
	
	alarm[3] = 8;
}
else if(action == "Sd2"){
	x -= 6;
	
	hitbox = instance_create_depth(x, y, 0, Knives_Sd_Hitbox_Obj);
	hitbox.spawner = "P2";
	
	action = "Sd3";
	
	alarm[3] = 8;
}
else if(action == "Sd3"){
	x -= 6;
	
	hitbox = instance_create_depth(x, y, 0, Knives_Sd_Hitbox_Obj);
	hitbox.spawner = "P2";
}
else if(action == "Su1"){
	hitbox = instance_create_depth(x, y, 0, Knives_Su_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Su2";
	h_speed += ms / 2;
	alarm[3] = 8;
}
else if(action == "Su2"){
	hitbox = instance_create_depth(x, y, 0, Knives_Su_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Su3";
	alarm[3] = 8;
}
else if(action == "Su3"){
	hitbox = instance_create_depth(x, y, 0, Knives_Su_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Su4";
	alarm[3] = 8;
}
else if(action == "Su4"){
	h_speed = 0;
	mask_index = Stand_Hurtbox_Spr;
}

// Inherit Anti cross up
event_inherited();