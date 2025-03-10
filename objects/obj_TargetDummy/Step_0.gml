timer--;

if (timer <= 0) {
	obj_Camera.target = obj_Player;
	instance_destroy();
}