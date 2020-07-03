if(global.P2_pick == noone){
	if(keyboard_check_pressed(global.P2_Backward)){
		if(place_free(x+24, y)){
			x += 24;
		}
		else{
			while(place_free(x-24, y)){
				x -= 24;
			}
		}
	}
	else if(keyboard_check_pressed(global.P2_Forward)){
		if(place_free(x-24, y)){
			x -= 24;
		}
		else{
			while(place_free(x+24, y)){
				x += 24;
			}
		}
	}
	else if(keyboard_check_pressed(global.P2_Up)){
		if(place_free(x, y-24)){
			y -= 24;
		}
		else{
			while(place_free(x, y+24)){
				y += 24;
			}
		}
	}
	else if(keyboard_check_pressed(global.P2_Down)){
		if(place_free(x, y+24)){
			y += 24;
		}
		else{
			while(place_free(x, y-24)){
				y -= 24;
			}
		}
	}
	else if(keyboard_check_pressed(global.P2_Attack)){
		audio_play_sound(Pick_snd, 1, false);
		
		if(place_meeting(x, y, Knight_Icon_Obj)){
			global.P2_pick = "Knight";
		}
		else if(place_meeting(x, y, Rapier_Icon_Obj)){
			global.P2_pick = "Rapier";
		}
		else if(place_meeting(x, y, Spear_Icon_Obj)){
			global.P2_pick = "Spear";
		}
		else if(place_meeting(x, y, Katana_Icon_Obj)){
			global.P2_pick = "Katana";
		}
		else if(place_meeting(x, y, Mace_Icon_Obj)){
			global.P2_pick = "Mace";
		}
		else if(place_meeting(x, y, Knives_Icon_Obj)){
			global.P2_pick = "Knives";
		}
		else if(place_meeting(x, y, Claws_Icon_Obj)){
			global.P2_pick = "Claws";
		}
		else if(place_meeting(x, y, Scythe_Icon_Obj)){
			global.P2_pick = "Scythe";
		}
	}
}
else if(keyboard_check_pressed(global.P2_Special)){
	global.P2_pick = noone;
}

// Preview
if(place_meeting(x, y, Knight_Icon_Obj)){
	P2_Character_Preview_Obj.sprite_index = Knight_Stand_Spr;
}
else if(place_meeting(x, y, Rapier_Icon_Obj)){
	P2_Character_Preview_Obj.sprite_index = Rapier_Stand_Spr;
}
else if(place_meeting(x, y, Spear_Icon_Obj)){
	P2_Character_Preview_Obj.sprite_index = Spear_Stand_Spr;
}
else if(place_meeting(x, y, Katana_Icon_Obj)){
	P2_Character_Preview_Obj.sprite_index = Katana_Stand_Spr;
}
else if(place_meeting(x, y, Mace_Icon_Obj)){
	P2_Character_Preview_Obj.sprite_index = Mace_Stand_Spr;
}
else if(place_meeting(x, y, Knives_Icon_Obj)){
	P2_Character_Preview_Obj.sprite_index = Knives_Stand_Spr;
}
else if(place_meeting(x, y, Claws_Icon_Obj)){
	P2_Character_Preview_Obj.sprite_index = Claws_Stand_Spr;
}
else if(place_meeting(x, y, Scythe_Icon_Obj)){
	P2_Character_Preview_Obj.sprite_index = Scythe_Stand_Spr;
}

// Sprite fix
if(place_meeting(x, y, P1_picker_Obj)){
	if(global.P2_pick == noone){
		sprite_index = P2_Picker_Half_Spr;
	}
	else{
		sprite_index = P2_Picked_Half_Spr;
	}
}
else{
	if(global.P2_pick == noone){
		sprite_index = P2_Picker_Spr;
	}
	else{
		sprite_index = P2_Picked_Spr;
	}
}