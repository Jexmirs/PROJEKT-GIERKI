image_angle += spin;

if(speed < 0.01) {
	instance_create_layer(x,y, "Instances", obj_Pickup)
	instance_destroy();	
}