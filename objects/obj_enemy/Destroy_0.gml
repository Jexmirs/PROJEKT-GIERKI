	var pickup = instance_create_layer(x,y, "Instances_2", obj_Pickup)
 	switch(enemy_current_weapon) {
 		case "m16":
 		pickup.sprite_index = sprM16;
 		break;
 		case "bat":
 		pickup.sprite_index = sprBat;
 		break;
 	}
 	instance_destroy();
	
obj_enemy.enemy_current_weapon = "none";