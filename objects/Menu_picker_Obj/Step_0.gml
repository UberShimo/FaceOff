if(keyboard_check_pressed(global.P1_Up)
|| gamepad_button_check_pressed(0, global.GP_Up)
|| gamepad_button_check_pressed(4, global.GP_Up)){
	if(place_free(x, y-12)){
		y -= 12;
	}
	else{
		while(place_free(x, y+12)){
			y += 12;
		}
	}
}
else if(keyboard_check_pressed(global.P1_Down)
|| gamepad_button_check_pressed(0, global.GP_Down)
|| gamepad_button_check_pressed(4, global.GP_Down)){
	if(place_free(x, y+12)){
		y += 12;
	}
	else{
		while(place_free(x, y-12)){
			y -= 12;
		}
	}
}
else if(keyboard_check_pressed(global.P1_Attack)
|| gamepad_button_check_pressed(0, global.GP_Attack)
|| gamepad_button_check_pressed(4, global.GP_Attack)){
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