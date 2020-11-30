/// @description My own hspeed logic

if(x > Player1_Obj.x +10 || h_speed > 0){
	x += h_speed;
}

if(friction > 0){
	if(h_speed > friction){
		h_speed -= friction;
	}
	else if(h_speed < -friction){
		h_speed += friction;
	}
	else{
		h_speed = 0;
	}
}