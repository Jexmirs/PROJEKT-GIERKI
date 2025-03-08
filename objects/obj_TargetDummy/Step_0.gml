timer--;

if (timer <= 0 && instance_exists(!obj_Player)) { 
	obj_Camera.target = obj_Player;
	
	instance_destroy();
	
	
	}