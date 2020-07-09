if(Up_Pressed){
	if(place_free(x, y-12)){
		y -= 12;
	}
	else{
		while(place_free(x, y+12)){
			y += 12;
		}
	}
}
else if(Down_Pressed){
	if(place_free(x, y+12)){
		y += 12;
	}
	else{
		while(place_free(x, y-12)){
			y -= 12;
		}
	}
}
else if(Attack_Pressed){
	audio_play_sound(Pick_snd, 1, false);
	
	if(place_meeting(x, y, PvP_Option_Obj)){
		room_goto(PvP_Select);
	}
	else if(place_meeting(x, y, PvCPU_Option_Obj)){
		room_goto(PvBot_Select);
	}
	else if(place_meeting(x, y, Help_Option_Obj)){
		room_goto(Help_Select);
	}
	else if(place_meeting(x, y, Exit_Option_Obj)){
		game_end();
	}
}