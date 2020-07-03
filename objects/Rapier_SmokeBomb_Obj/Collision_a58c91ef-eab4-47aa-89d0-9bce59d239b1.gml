repeat(20){
	obj = instance_create_depth(x, y, -20, Rapier_Smoke_Obj);
	obj.vspeed = random_range(0, -2.5);
	obj.hspeed = random_range(-2, 2);
}

instance_destroy();