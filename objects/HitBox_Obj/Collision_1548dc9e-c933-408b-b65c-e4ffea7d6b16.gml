if(spawner = "P2"){
	// HitPause logic
	if(hitStun > 0){
		global.worldSpeed = 0;
		Match_Controller_Obj.alarm[1] = hitPause; // Reset worldSpeed alarm
	}
	instance_destroy();
}