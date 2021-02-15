/// @param player
/// @param hitboxType

player = argument0;
hitboxType = argument1;

// Gotta get object_index
if(object_is_ancestor(player.object_index, Player1_Obj)){
	xtraX = 4;
}
else{
	xtraX = -4;
}

if(hitboxType == "H"){
	instance_create_depth(player.x + xtraX, player.y+8, -5, Hit_Eff_Obj);
}
else if(hitboxType == "L"){
	instance_create_depth(player.x + xtraX, player.y+18, -5, Hit_Eff_Obj);
}
else if(hitboxType == "D"){
	instance_create_depth(player.x + xtraX, player.y+8, -5, Hit_Eff_Obj);
}
else{
	instance_create_depth(player.x + xtraX, player.y+12, -5, Hit_Eff_Obj);
}