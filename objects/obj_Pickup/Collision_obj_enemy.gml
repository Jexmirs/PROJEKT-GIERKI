	switch(sprite_index) {
            case sprM16:
                obj_enemy.sprite_index = sprPWalkM16;
                obj_enemy.enemy_current_weapon = "m16";
				global.picked_weapon = true;
                break;
            case sprBat:
                obj_enemy.sprite_index = sprPWalkBat;
                obj_enemy.enemy_current_weapon = "bat";
				global.picked_weapon = true;
                break;
			case sprShotgun:
			    obj_enemy.sprite_index = sprPWalkShotgun;
                obj_enemy.enemy_current_weapon = "shotgun";
				global.picked_weapon = true;
				break;
			case sprMP5:
				obj_enemy.sprite_index = sprPWalkMP5;
				obj_enemy.enemy_current_weapon = "mp5";
				break;
			case sprPistol:
				obj_enemy.sprite_index = sprPWalkSilencer;
				obj_enemy.enemy_current_weapon = "pistol";
			case sprUzi:
				obj_enemy.sprite_index = sprPWalkUzi;
				obj_enemy.enemy_current_weapon = "uzi";
				break;
        }
        instance_destroy();

