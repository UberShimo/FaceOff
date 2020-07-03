/// @description hitbox etc

if(action == "An1" || action == "An2" || action == "An3" || action == "An4"){
	hitbox = instance_create_depth(x, y, 0, Claws_An_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Af1" || action == "Af2"){
	x -= 4;
	
	hitbox = instance_create_depth(x, y, 0, Claws_Af_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ab"){
	x -= 8;
	
	hitbox = instance_create_depth(x, y, 0, Claws_Ab_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	mask_index = Stand_Hurtbox_Spr;
}
else if(action == "Ad"){
	hitbox = instance_create_depth(x, y, 0, Claws_Ad_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	mask_index = Duck_Hurtbox_Spr;
}
else if(action == "Au"){
	hitbox = instance_create_depth(x, y, 0, Claws_Au_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Au_sit";
	alarm[3] = 12;
}
else if(action == "Au_sit"){
	hspeed = 0;
}
else if(action == "Sn"){	
	fading_away = true;
}
else if(action == "Sf"){
	hitbox = instance_create_depth(x, y, 0, Claws_Sf_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.hspeed = hspeed;
	hitbox.image_xscale = -1;
	action = "Sf_landing";
	
	hspeed = ms * 0.5
	alarm[3] = 16;
}
else if(action == "Sf_landing"){
	aerial = false;
	hspeed = 0;
	mask_index = Duck_Hurtbox_Spr;
}
else if(action == "Sb"){
	hspeed = 0;
	friction = 0;
}
else if(action == "Sb_then_A"){
	hitbox = instance_create_depth(x, y, 0, Claws_Sd_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.hspeed = hspeed;
	hitbox.image_xscale = -1;
	
	friction = 0.2;
	mask_index = Duck_Hurtbox_Spr;
}
else if(action == "Sd"){
	hitbox = instance_create_depth(x, y, 0, Claws_Sd_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Su"){
	hitbox = instance_create_depth(x, y, 0, Claws_Su_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	mask_index = Stand_Hurtbox_Spr;
}