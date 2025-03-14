var player = instance_nearest(x, y, obj_Player);

if (player.current_weapon == "none") {
    if(mouse_check_button_pressed(mb_right)) {
        switch(sprite_index) {
            case sprM16:
                player.sprite_index = sprPWalkM16;
                player.current_weapon = "rifle";
				audio_play_sound(PickupWeapon, 1, false);
                break;
            case sprBat:
                player.sprite_index = sprPWalkBat;
                player.current_weapon = "bat";
				audio_play_sound(PickupWeapon, 1, false);
                break;
			case sprShotgun:
                player.sprite_index = sprPWalkShotgun;
                player.current_weapon = "shotgun";
				audio_play_sound(PickupWeapon, 1, false);
                break;
			case sprMP5:
				player.sprite_index = sprPWalkMP5;
				player.current_weapon = "mp5";
				audio_play_sound(PickupWeapon, 1, false);
            break;
			case sprUzi:
				player.sprite_index = sprPWalkUzi;
				player.current_weapon = "uzi";
				audio_play_sound(PickupWeapon, 1, false);
			break;
			case sprPistol:
				player.sprite_index = sprPWalkSilencer;
				player.current_weapon = "pistol";
				audio_play_sound(PickupWeapon, 1, false);
			break;
			case sprKnife:
				player.sprite_index = sprPWalkKnife;
				player.current_weapon = "knife";
				audio_play_sound(PickupWeapon, 1, false);
			break;
			case sprAxe:
				player.sprite_index = sprPWalkAxe;
				player.current_weapon = "axe";
				audio_play_sound(PickupWeapon, 1, false);
			break;
        }
        instance_destroy();
    }
}

