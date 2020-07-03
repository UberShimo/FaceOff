if(phase == 1){
	y -= 4;
	
	if(y <= Player1_Obj.y - 24){
		phase = 2;
	}
}
else if(phase == 2){
	x += 1;
	
	if(x > Player2_Obj.x - 8){
		phase = 3;
	}
}
else if(phase == 3){
	sprite_index = Scythe_Bird_Dive_Spr;
	image_index = 0;
	alarm[3] = 10;
	alarm[9] = 18;
	
	phase = noone;
}