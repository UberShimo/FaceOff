num = random_range(0, 8);

if(num < 1){
	return "Knight";
}
else if(num < 2){
	return "Rapier";
}
else if(num < 3){
	return "Spear";
}
else if(num < 4){
	return "Katana";
}
else if(num < 5){
	return "Mace";
}
else if(num < 6){
	return "Knives";
}
else if(num < 7){
	return "Claws";
}
else{
	return "Scythe";
}