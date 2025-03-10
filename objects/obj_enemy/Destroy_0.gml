	var pickup = instance_create_layer(x,y, "Instances_2", obj_Pickup)
	switch(current_weapon) {
		case "m16":
		pickup.sprite_index = sprM16;
		break;
		case "bat":
		pickup.sprite_index = sprBat;
		break;
	}
	instance_destroy();
	
