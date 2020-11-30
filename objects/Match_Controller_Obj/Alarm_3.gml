/// @description Phrase

if(phrase == "three"){
	sprite_index = Three_Spr;
	phrase = "two";
	
	alarm[3] = 30;
}
else if(phrase == "two"){
	sprite_index = Two_Spr;
	phrase = "one";
	
	alarm[3] = 30;
}
else if(phrase == "one"){
	sprite_index = One_Spr;
	phrase = "go";
	
	alarm[3] = 30;
}
else if(phrase == "go"){
	sprite_index = GO_Spr;
	phrase = "none";
	global.duelHasStarted = true;
	
	alarm[3] = 60;
	audio_play_sound(GO_snd, 5, false);
}
else if(phrase == "none"){
	sprite_index = noone;
}

else if(phrase == "draw"){
	sprite_index = Draw_Spr;
}

else if(phrase == "P1_wins"){
	sprite_index = P1_Wins_Spr;
}

else if(phrase == "P2_wins"){
	sprite_index = P2_Wins_Spr;
}
