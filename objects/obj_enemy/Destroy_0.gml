	var pickup = instance_create_layer(x,y, "Instances_2", obj_Pickup)
 	switch(enemy_current_weapon) {
 		case "m16":
 		pickup.sprite_index = sprM16;
 		break;
 		case "bat":
 		pickup.sprite_index = sprBat;
 		break;
		case "knife":
 		pickup.sprite_index = sprKnife;
 		break;
		case "axe":
 		pickup.sprite_index = sprAxe;
 		break;
		case "uzi":
 		pickup.sprite_index = sprUzi;
 		break;
		case "mp5":
 		pickup.sprite_index = sprMP5;
 		break;
		case "shotgun":
 		pickup.sprite_index = sprShotgun;
 		break;
		case "none":
		pickup.sprite_index = spr_Nothing;
		break;
 	}
 	instance_destroy();
	
enemy_current_weapon = "none";