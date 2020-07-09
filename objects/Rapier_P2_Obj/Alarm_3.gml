/// @description hitbox etc

if(action == "An1" || action == "An2"){
	if(Forward_Check){
		x -= 8;
	}
	else if(Backward_Check){
		x += 8;
	}
	hitbox = instance_create_depth(x, y, 0, Rapier_An_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Af"){
	x -= 20;
	
	hitbox = instance_create_depth(x, y, 0, Rapier_Af_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ab"){
	x -= 12;
	
	hitbox = instance_create_depth(x, y, 0, Rapier_Ab_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Ad"){
	hitbox = instance_create_depth(x, y, 0, Rapier_Ad_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Au"){
	hitbox = instance_create_depth(x, y, 0, Rapier_Au_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Sn"){
	x -= 6;
	
	if(Down_Check){
		hitbox = instance_create_depth(x, y, 0, Rapier_Sn_then_D_Hitbox_Obj);
		hitbox.spawner = "P2";
		hitbox.image_xscale = -1;
		
		sprite_index = Rapier_Sn_then_D_Spr;
		image_index = 0;
	}
	else{
		hitbox = instance_create_depth(x, y, 0, Rapier_Sn_Hitbox_Obj);
		hitbox.spawner = "P2";
		hitbox.image_xscale = -1;
	}
}
else if(action == "Sf"){
	hitbox = instance_create_depth(x, y, 0, Rapier_Sf_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Sb1"){
	x -= 4;
	
	hitbox = instance_create_depth(x, y, 0, Rapier_Sb1_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
	
	action = "Sb2";
	alarm[3] = 16;
}
else if(action == "Sb2"){
	x -= 4;
	
	hitbox = instance_create_depth(x, y, 0, Rapier_Sb2_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}
else if(action == "Sd"){
	instance_create_depth(x, y+18, -10, Rapier_SmokeBomb_Obj);
}
else if(action == "Su"){
	hitbox = instance_create_depth(x, y, 0, Rapier_Su_Hitbox_Obj);
	hitbox.spawner = "P2";
	hitbox.image_xscale = -1;
}