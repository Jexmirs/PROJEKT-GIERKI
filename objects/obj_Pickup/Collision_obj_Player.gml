var player = instance_nearest(x, y, obj_Player);

if (player.current_weapon == "none") {
    if(mouse_check_button_pressed(mb_right)) {
        switch(sprite_index) {
            case sprM16:
				obj_Player.weapon_pickup_delay--;
                player.sprite_index = sprPWalkM16;
                player.current_weapon = "rifle";
                break;
            case sprBat:
				obj_Player.weapon_pickup_delay--;
                player.sprite_index = sprPWalkBat;
                player.current_weapon = "bat";
                break;
        }
        instance_destroy();
    }
}
