/// @description My own h/v speed logic

if(x > Player1_Obj.x +10 || h_speed > 0){
	x += h_speed * global.worldSpeed;
}

if(friction > 0){
	if(h_speed > friction){
		h_speed -= friction * global.worldSpeed;
	}
	else if(h_speed < -friction){
		h_speed += friction * global.worldSpeed;
	}
	else{
		h_speed = 0;
	}
}

// vspeed
if(action == "launched"){
	y += v_speed * global.worldSpeed;
	v_speed += global.gravityValue * global.worldSpeed;
}
else{
	v_speed = 0;
	if(!place_free(x, y+1)){
		move_contact_solid(-90, -1);
	}
}