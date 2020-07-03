if(!someoneHasDied && (Player1_Obj.HP <= 0 || Player2_Obj.HP <= 0)){
	someoneHasDied = true;
	global.duelHasStarted = false;
	
	if(Player1_Obj.HP <= 0){
		P2_score += 1;
	}
	if(Player2_Obj.HP <= 0){
		P1_score += 1;
	}
	
	phrase = "three";
	
	alarm[0] = 240;
	alarm[3] = 300;
	
	// Someone wins
	if(P1_score == 3 || P2_score == 3){
		if(P1_score == 3 && P2_score == 3){
			phrase = "draw";
		}
		else if(P1_score == 3){
			phrase = "P1_wins";
		}
		else if(P2_score = 3){
			phrase = "P2_wins";
		}
	
		alarm[0] = 0;
		alarm[3] = 1;
		alarm[9] = 300;
	}
}