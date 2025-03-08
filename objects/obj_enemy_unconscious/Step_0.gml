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
		instance_create_layer(x,y, "Instances", obj_enemy_dead);
		
		var i;
		for (i = 0; i < 5; i++) {
        var blood_x = x + random_range(-20, 20);
        var blood_y = y + random_range(-20, 20);
        
        if (!place_free(blood_x, blood_y) || 
            collision_point(blood_x, blood_y, obj_Wall, false, true) ||
            collision_point(blood_x, blood_y, obj_horizontaldoors, false, true) ||
            collision_point(blood_x, blood_y, obj_verticaldoors, false, true)) {
            continue;
        }
        
        var blood = instance_create_layer(blood_x, blood_y, "Instances", obj_blood);
        blood.image_index = irandom(7);
        blood.image_scale = random_range(0.5, 3);
		instance_destroy();
    }
	}
}

if (obj_enemy_unconscious.image_speed > 0)
{
    animation_delay++
}