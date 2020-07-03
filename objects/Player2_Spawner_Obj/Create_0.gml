if(global.P2_pick != noone){
	if(global.P2_pick == "Knight"){
		instance_create_depth(x, y, 0, Knight_P2_Obj);
	}
	else if(global.P2_pick == "Rapier"){
		instance_create_depth(x, y, 0, Rapier_P2_Obj);
	}
	else if(global.P2_pick == "Spear"){
		instance_create_depth(x, y, 0, Spear_P2_Obj);
	}
	else if(global.P2_pick == "Katana"){
		instance_create_depth(x, y, 0, Katana_P2_Obj);
	}
	else if(global.P2_pick == "Mace"){
		instance_create_depth(x, y, 0, Mace_P2_Obj);
	}
	else if(global.P2_pick == "Knives"){
		instance_create_depth(x, y, 0, Knives_P2_Obj);
	}
	else if(global.P2_pick == "Claws"){
		instance_create_depth(x, y, 0, Claws_P2_Obj);
	}
	else if(global.P2_pick == "Scythe"){
		instance_create_depth(x, y, 0, Scythe_P2_Obj);
	}
}
else{
	if(global.CPU_pick == "Knight"){
		instance_create_depth(x, y, 0, Knight_CPU_Obj);
	}
	else if(global.CPU_pick == "Rapier"){
		instance_create_depth(x, y, 0, Rapier_CPU_Obj);
	}
	else if(global.CPU_pick == "Spear"){
		instance_create_depth(x, y, 0, Spear_CPU_Obj);
	}
	else if(global.CPU_pick == "Katana"){
		instance_create_depth(x, y, 0, Katana_CPU_Obj);
	}
	else if(global.CPU_pick == "Mace"){
		instance_create_depth(x, y, 0, Mace_CPU_Obj);
	}
	else if(global.CPU_pick == "Knives"){
		instance_create_depth(x, y, 0, Knives_CPU_Obj);
	}
	else if(global.CPU_pick == "Claws"){
		instance_create_depth(x, y, 0, Claws_CPU_Obj);
	}
	else if(global.CPU_pick == "Scythe"){
		instance_create_depth(x, y, 0, Scythe_CPU_Obj);
	}
}