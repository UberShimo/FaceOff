/// @description hitbox etc

if(action == "An1" || action == "An2"){
	x -= 4;
	
	hitbox = instance_create_depth(x, y, 0, Katana_An_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Af"){
	hitbox = instance_create_depth(x, y, 0, Katana_Af_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ab1"){
	hitbox = instance_create_depth(x, y, 0, Katana_Ab_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	action = "Ab2";
	aerial = true;
	
	hspeed = ms;
	friction = 0.1;
	mask_index = Jump_Hurtbox_Spr;
	alarm[3] = 16;
}
else if(action == "Ab2"){
	aerial = false;
	mask_index = Stand_Hurtbox_Spr;
}
else if(action == "Ad"){
	hitbox = instance_create_depth(x, y, 0, Katana_Ad_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Au"){
	hitbox = instance_create_depth(x, y, 0, Katana_Au_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	mask_index = Stand_Hurtbox_Spr;
}
// EAGLE
else if(action == "Into_Eagle"){
	action = "Eagle";
	aerial = false;
	
	hspeed = 0;
	sprite_index = Katana_Eagle_Spr;
	mask_index = Stand_Hurtbox_Spr;
}
else if(action == "Eagle_A"){
	hitbox = instance_create_depth(x, y, 0, Katana_Eagle_A_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Eagle_Ad"){
	hitbox = instance_create_depth(x, y, 0, Katana_Eagle_Ad_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	action = "Into_Eagle";
	
	alarm[3] = 16;
}
else if(action == "Eagle_Ab"){
	hitbox = instance_create_depth(x, y, 0, Katana_Eagle_Ab_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Into_Viper";
	hspeed = -ms;
	alarm[2] = 6; 
	alarm[3] = 16;
}
// VIPER
else if(action == "Into_Viper"){
	action = "Viper";
	
	hspeed = 0;
	sprite_index = Katana_Viper_Spr;
	mask_index = Stand_Hurtbox_Spr;
}
else if(action == "Viper_A"){
	x -= 8;
	
	hitbox = instance_create_depth(x, y, 0, Katana_Viper_A_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Viper_Ad1"){
	hitbox = instance_create_depth(x, y, 0, Katana_Viper_Ad1_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Viper_Ad2";
	hspeed = 0;
	alarm[3] = 8;
}
else if(action == "Viper_Ad2"){
	hitbox = instance_create_depth(x, y, 0, Katana_Viper_Ad2_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	action = "Into_Viper";
	
	hspeed = -ms;
	alarm[2] = 10;
	alarm[3] = 24;
}
else if(action == "Viper_Ab"){
	hitbox = instance_create_depth(x, y, 0, Katana_Viper_Ab_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	action = "Into_Tiger";
	
	mask_index = Duck_Hurtbox_Spr;
	alarm[3] = 24;
}
// TIGER
else if(action == "Into_Tiger"){
	action = "Tiger";
	
	hspeed = 0;
	friction = 0;
	sprite_index = Katana_Tiger_Spr;
	mask_index = Duck_Hurtbox_Spr;
}
else if(action == "Tiger_A"){
	x -= 16;
	
	hitbox = instance_create_depth(x, y, 0, Katana_Tiger_A_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	mask_index = Stand_Hurtbox_Spr;
}
else if(action == "Tiger_Ad"){
	hitbox = instance_create_depth(x, y, 0, Katana_Tiger_Ad_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	hspeed = ms;
	hitbox.hspeed = hspeed;
	friction = 0.1;
}
else if(action == "Tiger_Ab"){
	x -= 4;
	
	hitbox = instance_create_depth(x, y, 0, Katana_Tiger_Ab_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Into_Eagle";
	mask_index = Stand_Hurtbox_Spr;
	alarm[3] = 16;
}