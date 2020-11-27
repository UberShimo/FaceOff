/// @description CPU MIND

if(action == "none" || blocking){
	Forward = false;
	Backward = false;
	Up = false;
	Down = false;
	Attack = false;
	Special = false;
	Block = false;

	choice = random_range(0, 5);
	
	// Distance logic
	if(Player1_Obj.x < x - 80){
		if(choice < 1){
			Block = true;
	
			alarm[10] = random_range(20, 60);
		}
		else if(choice < 2){
			Block = true;
			Down = true;
	
			alarm[10] = random_range(20, 60);
		}
		else if(choice < 3){
			Backward = true;
			Special = true;
			
			alarm[10] = 12;
		}
		else if(choice < 4){
			Down = true;
			Special = true;
			
			alarm[10] = 12;
		}
		else{
			Forward = true;
	
			alarm[10] = random_range(20, 60);
		}
	}
	// Close logic
	else{
		// Neutral
		if(choice < 1){
			Block = true;
	
			alarm[10] = random_range(20, 60);
	
			ActionChoice = random_range(0, 3);
	
			if(ActionChoice < 1){
				Attack = true;
				alarm[10] = 40;
			}
			else if(ActionChoice < 2){
				Special = true;
				alarm[10] = 12;
			}
		}
		// Duck
		else if(choice < 2){
			Block = true;
			Down = true;
	
			alarm[10] = random_range(20, 60);
		
			ActionChoice = random_range(0, 3);
	
			if(ActionChoice < 1){
				Attack = true;
				alarm[10] = 12;
			}
			else if(ActionChoice < 2){
				Special = true;
				alarm[10] = 12;
			}
		}
		// Back
		else if(choice < 3 && !place_meeting(x + 32, y, OutOfBounds_Obj)){
			Backward = true;

			alarm[10] = random_range(8, 16);
		
			ActionChoice = random_range(0, 3);
	
			if(ActionChoice < 1){
				Attack = true;
				alarm[10] = 12;
			}
			else if(ActionChoice < 2){
				Special = true;
				alarm[10] = 12;
			}
		}
		// Forward
		else if(choice < 4 || Player1_Obj.x < x - 48){
			Forward = true;
	
			alarm[10] = random_range(8, 24);
		
			ActionChoice = random_range(0, 3);
	
			if(ActionChoice < 1){
				Attack = true;
				alarm[10] = 12;
			}
			else if(ActionChoice < 2){
				Special = true;
				alarm[10] = 12;
			}
		}
		// Jump
		else if(choice < 5){
			Up = true;
			JumpDir = random_range(0, 5);
			ActionChoice = random_range(0, 3);
	
			if(JumpDir < 1){
				Backward = true;
			}
			else if(JumpDir < 3){
				Forward = true;
			}
	
			if(ActionChoice < 1){
				Attack = true;
			}
			else if(ActionChoice < 2){
				Special = true;
			}
	
			alarm[10] = 16;
		}
	}
}
else{
	Forward = false;
	Backward = false;
	Up = false;
	Down = false;
	Attack = false;
	Special = false;
	Block = false;
	
	alarm[10] = 8;
}