if (!place_meeting(x, y, obj_Player)) {
    if (keyboard_check(ord("E"))) {
        obj_Player.image_alpha = 0;
        sprite_index = sprPAttackBash;
        image_speed = 0;
        image_index = 0;
		global.attacking = true;
    }

    if (keyboard_check_pressed(vk_space)) {
        image_speed = 2;
    }
	
	if(animation_delay > 140) {
		image_speed = 0;
		animation_delay = 0;
		kicked_head++;
	}
	
	if(kicked_head = 3) {
		obj_enemy_unconscious.sprite_index = sprEBackHeadbutt
		obj_Player.image_alpha = 1;
		global.attacking = false;
	}
}

if (obj_enemy_unconscious.image_speed > 0)
{
    animation_delay++
}