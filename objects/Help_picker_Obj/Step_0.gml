if(keyboard_check_pressed(global.P1_Backward)){
	if(place_free(x-24, y)){
		x -= 24;
	}
	else{
		while(place_free(x+24, y)){
			x += 24;
		}
	}
}
else if(keyboard_check_pressed(global.P1_Forward)){
	if(place_free(x+24, y)){
		x += 24;
	}
	else{
		while(place_free(x-24, y)){
			x -= 24;
		}
	}
}
else if(keyboard_check_pressed(global.P1_Up)){
	if(place_free(x, y-24)){
		y -= 24;
	}
	else{
		while(place_free(x, y+24)){
			y += 24;
		}
	}
}
else if(keyboard_check_pressed(global.P1_Down)){
	if(place_free(x, y+24)){
		y += 24;
	}
	else{
		while(place_free(x, y-24)){
			y -= 24;
		}
	}
}
else if(keyboard_check_pressed(global.P1_Attack)){
	audio_play_sound(Pick_snd, 1, false);
	
	if(place_meeting(x, y, Knight_Icon_Obj)){
		room_goto(Knight_Help);
	}
	else if(place_meeting(x, y, Rapier_Icon_Obj)){
		room_goto(Rapier_Help);
	}
	else if(place_meeting(x, y, Spear_Icon_Obj)){
		room_goto(Spear_Help);
	}
	else if(place_meeting(x, y, Katana_Icon_Obj)){
		room_goto(Katana_Help);
	}
	else if(place_meeting(x, y, Mace_Icon_Obj)){
		room_goto(Mace_Help);
	}
	else if(place_meeting(x, y, Knives_Icon_Obj)){
		room_goto(Knives_Help);
	}
	else if(place_meeting(x, y, Claws_Icon_Obj)){
		room_goto(Claws_Help);
	}
	else if(place_meeting(x, y, Scythe_Icon_Obj)){
		room_goto(Scythe_Help);
	}
}

if(keyboard_check_pressed(global.P1_Special)){
	room_goto(Menu);
}