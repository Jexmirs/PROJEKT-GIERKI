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
        }
        instance_destroy();

