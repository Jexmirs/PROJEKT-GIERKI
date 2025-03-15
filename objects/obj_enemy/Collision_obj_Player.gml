if (enemy_current_weapon == "bat") {
    var radius = 20;
    if (point_distance(x, y, obj_Player.x, obj_Player.y) <= radius) {
        obj_enemy.sprite_index = sprEAttackBat;
        image_speed = 0.5;
		delay++

        if (delay > 10) {
            var offset = 5;
            var swing_x = x + lengthdir_x(offset, image_angle);
            var swing_y = y + lengthdir_y(offset, image_angle);

            var swing = instance_create_layer(swing_x, swing_y, "Instances", obj_Swing);
            swing.direction = image_angle;
            swing.image_angle = swing.direction;
            swing.owner = id;
            audio_play_sound(Swing1, 1, false);
        }
		instance_destroy(obj_Player);
		instance_destroy(obj_Camera);
    }
}

if (enemy_current_weapon == "axe") {
    var radius = 20;
    if (point_distance(x, y, obj_Player.x, obj_Player.y) <= radius) {
        obj_enemy.sprite_index = sprPAttackAxe;
        image_speed = 0.5;
		delay++

        if (delay > 10) {
            var offset = 5;
            var swing_x = x + lengthdir_x(offset, image_angle);
            var swing_y = y + lengthdir_y(offset, image_angle);

            var swing = instance_create_layer(swing_x, swing_y, "Instances", obj_Swing);
            swing.direction = image_angle;
            swing.image_angle = swing.direction;
            swing.owner = id;
            audio_play_sound(Swing1, 1, false);
        }
		instance_destroy(obj_Player);
		instance_destroy(obj_Camera);
    }
}

if (enemy_current_weapon == "knife") {
    var radius = 20;
    if (point_distance(x, y, obj_Player.x, obj_Player.y) <= radius) {
        obj_enemy.sprite_index = sprPAttackKnife;
        image_speed = 0.5;
		delay++

        if (delay > 10) {
            var offset = 5;
            var swing_x = x + lengthdir_x(offset, image_angle);
            var swing_y = y + lengthdir_y(offset, image_angle);

            var swing = instance_create_layer(swing_x, swing_y, "Instances", obj_Swing);
            swing.direction = image_angle;
            swing.image_angle = swing.direction;
            swing.owner = id;
            audio_play_sound(Swing1, 1, false);
        }
		instance_destroy(obj_Player);
		instance_destroy(obj_Camera);
    }
}
