if(Left_Pressed){
	if(place_free(x-24, y)){
		x -= 24;
	}
	else{
		while(place_free(x+24, y)){
			x += 24;
		}
	}
}
else if(Right_Pressed){
	if(place_free(x+24, y)){
		x += 24;
	}
	else{
		while(place_free(x-24, y)){
			x -= 24;
		}
	}
}
else if(Up_Pressed){
	if(place_free(x, y-24)){
		y -= 24;
	}
	else{
		while(place_free(x, y+24)){
			y += 24;
		}
	}
}
else if(Down_Pressed){
	if(place_free(x, y+24)){
		y += 24;
	}
	else{
		while(place_free(x, y-24)){
			y -= 24;
		}
	}
}
else if(Choose_Pressed){
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

if(place_meeting(x, y, Xbox_Icon_Obj)){
	Xbox_Controls_Obj.visible = true;
}
else{
	Xbox_Controls_Obj.visible = false;
}

if(Back_Pressed){
	room_goto(Menu);
}