/// @description Blast CD

hasBlast = true;

if(aerial){
	instance_create_depth(x, y-12, 1, Scythe_Blast_Regain_Obj);
}
else{
	instance_create_depth(x, y, 1, Scythe_Blast_Regain_Obj);
}