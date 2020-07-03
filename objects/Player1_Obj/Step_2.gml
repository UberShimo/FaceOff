// Buffers decrease
if(Abuffer > 0){
	Abuffer--;
}

if(Sbuffer > 0){
	Sbuffer--;
}

if(Dbuffer > 0){
	Dbuffer--;
}


// Anti cross up
if(x > Player2_Obj.x -10 && hspeed > 0){
	hspeed = 0;
}
while(x > Player2_Obj.x -8){
	x -= 2;
}