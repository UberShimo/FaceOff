/// @description hitbox etc

if(action == "An1" || action == "An2"){
	hitbox = instance_create_depth(x, y, 0, Knight_An_Hitbox_Obj);
	hitbox.spawner = "P1";
}
else if(action == "Af"){
	hitbox = instance_create_depth(x, y, 0, Knight_Af_Hitbox_Obj);
	hitbox.spawner = "P1";
}
else if(action == "Ab"){
	hitbox = instance_create_depth(x, y, 0, Knight_Ab_Hitbox_Obj);
	hitbox.spawner = "P1";
}
else if(action == "Ad"){
	hitbox = instance_create_depth(x, y, 0, Knight_Ad_Hitbox_Obj);
	hitbox.spawner = "P1";
}
else if(action == "Au"){
	hitbox = instance_create_depth(x, y, 0, Knight_Au_Hitbox_Obj);
	hitbox.spawner = "P1";
}