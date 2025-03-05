var player = instance_nearest(x, y, obj_Player);

if (player.current_weapon == "none") {
    if (keyboard_check(ord("E"))) {
        switch(sprite_index) {
            case spr_uzi:
                player.sprite_index = sprPWalkUzi;
                player.current_weapon = "rifle";
                break;
            case sprBat:
                player.sprite_index = sprPWalkBat;
                player.current_weapon = "bat";
                break;
        }
        instance_destroy();
    }
}
