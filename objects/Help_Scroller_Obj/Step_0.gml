if(keyboard_check(global.P1_Up) && place_free(x, y-2)){
	y -= 2;
}
else if(keyboard_check(global.P1_Down) && place_free(x, y+2)){
	y += 2;
}

if(keyboard_check(global.P1_Special)){
	room_goto(Help_Select);
}