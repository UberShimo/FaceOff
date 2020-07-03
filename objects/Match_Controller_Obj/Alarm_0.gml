/// @description Reset characters

someoneHasDied = false;

with(Player1_Obj) instance_destroy();
with(Player2_Obj) instance_destroy();

with(Player1_Spawner_Obj){
	instance_create_depth(x, y, 0, Player1_Spawner_Obj);
	instance_destroy();
}

with(Player2_Spawner_Obj){
	instance_create_depth(x, y, 0, Player2_Spawner_Obj);
	instance_destroy();
}