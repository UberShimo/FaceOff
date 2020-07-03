if(fadeOut){
	image_alpha -= 0.01;
}
if(image_alpha < 0){
	instance_destroy();
}

if(hspeed > 0){
	hspeed -= 0.1;
}
else if(hspeed < 0){
	hspeed += 0.1;
}
if(vspeed > 0){
	vspeed -= 0.1;
}
else if(vspeed < 0){
	vspeed += 0.1;
}

x += random_range(-0.1, 0.1);
y += random_range(-0.1, 0.1);