timer--;

if (timer <= 0) {
	obj_camera.target = obj_player;
	instance_destroy();
}