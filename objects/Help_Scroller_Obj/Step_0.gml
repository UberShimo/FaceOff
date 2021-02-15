if(Up_Check && place_free(x, y-2)){
	y -= 2;
}
else if(Down_Check && place_free(x, y+2)){
	y += 2;
}

if(Back_Pressed){
	room_goto(Help_Select);
}