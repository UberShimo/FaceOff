/// @description hitbox etc

if(action == "An1"){
	x -= 8;
	
	hitbox = instance_create_depth(x, y, 0, Mace_An1_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
if(action == "An2"){
	x -= 4;
	hitbox = instance_create_depth(x, y, 0, Mace_An2_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Af1" || action == "Af2"){
	x -= 2;
	
	hitbox = instance_create_depth(x, y, 0, Mace_Af_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ab"){
	hitbox = instance_create_depth(x, y, 0, Mace_Ab_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ad"){
	hitbox = instance_create_depth(x, y, 0, Mace_Ad_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Au"){
	hitbox = instance_create_depth(x, y, 0, Mace_Au_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	mask_index = Stand_Hurtbox_Spr;
}
else if(action == "Sn_start"){
	action = "Sn";
	alarm[3] = 10;
	
	parry_H = true;
}
else if(action == "Sn"){
	parry_H = false;
}
else if(action == "Sf"){
	hitbox = instance_create_depth(x, y, 0, Mace_Sf_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	instance_create_depth(x-16, y+24, -5, Mace_Bomb_P2_Obj);
}
else if(action == "Sb"){
	hitbox = instance_create_depth(x, y, 0, Mace_Sb_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Sd_start"){
	action = "Sd";
	alarm[3] = 10;
	
	parry_L = true;
}
else if(action == "Sd"){
	parry_L = false;
}
else if(action == "Su"){
	hitbox = instance_create_depth(x, y, 0, Mace_Su_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	instance_create_depth(x-16, y+24, -5, Mace_Bomb_P2_Obj);
}
else if(action == "parry_H" || action == "parry_L"){
	Player1_Obj.sprite_index = Player1_Obj.guardBreakSprite;
}

// Inherit Anti cross up
event_inherited();