/// @description Anti cross up
if(x > Player2_Obj.x -10 && hspeed > 0){
	hspeed = 0;
}
while(x > Player2_Obj.x -8){
	x -= 2;
}