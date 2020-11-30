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


// This may be unnecessary
// Anti cross up and fix so you cant get out of bounds on wrong side
while(x > Player2_Obj.x -8 || x > room_width - 32){
	x -= 2;
}