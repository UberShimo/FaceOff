/// @description Teleport CD

teleports += 1;
instance_create_depth(x, y, -4, Regain_Teleport_Obj);

if(teleports < 2){
	alarm[5] = 180;
}