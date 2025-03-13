if (!variable_global_exists("current_patrol_index")) {
    global.current_patrol_index = 0;
}

var target_x = patrol_points[global.current_patrol_index][0];
var target_y = patrol_points[global.current_patrol_index][1];

if (idling) {
    switch (idle) {
        case "peeing":
            sprite_index = sprEIdlePee;
            image_speed = 1;
			path_end();
            break;
        case "smoking":
            sprite_index = sprEIdleSmoke;
            image_speed = 1;
			path_end();
            break;
        case "standing":
            sprite_index = sprEWalkUnarmedn;
            image_speed = 0;
			path_end();
            break;
        case "guarding":
            sprite_index = sprEStandGuard;
            image_speed = 1;
			path_end();
            break;
    }
}

if (can_see_player && see_player_shoot_delay > 2 && instance_exists(obj_Player)) {
    switch (enemy_current_weapon) {
        case "m16":
            if (shoot_delay <= 0) {
                shooted = true;
                shoot_delay = 10;

                var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
                bullet.direction = point_direction(x, y, obj_Player.x, obj_Player.y);
                bullet.image_angle = bullet.direction;
                bullet.speed = 10;
				audio_play_sound(M16, 1, false);
            }
			break;
			case "shotgun":
            if (shoot_delay <= 0) {
                shooted = true;
                shoot_delay = 10;

                for (var i = -10; i <= 10; i += 5) {
				var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
                    bullet.direction = point_direction(x, y, mouse_x, mouse_y) + i;
                    bullet.image_angle_ = bullet.direction;
                    bullet.speed = 8;
					audio_play_sound(Shotgun, 1, false);
                }
			break;
			}
			case "uzi":
            if (shoot_delay <= 0) {
                shooted = true;
                shoot_delay = 10;

                var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
                bullet.direction = point_direction(x, y, obj_Player.x, obj_Player.y);
                bullet.image_angle = bullet.direction;
                bullet.speed = 18;
				audio_play_sound(Uzi, 1, false);
            }
            break;
			case "pistol":
            if (shoot_delay <= 0) {
                shooted = true;
                shoot_delay = 10;

                var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
                bullet.direction = point_direction(x, y, obj_Player.x, obj_Player.y);
                bullet.image_angle = bullet.direction;
                bullet.speed = 8;
				audio_play_sound(Pistol, 1, false);
            }
            break;
			case "mp5":
            if (shoot_delay <= 0) {
                shooted = true;
                shoot_delay = 10;

                var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
                bullet.direction = point_direction(x, y, obj_Player.x, obj_Player.y);
                bullet.image_angle = bullet.direction;
                bullet.speed = 14;
				audio_play_sound(MP5, 1, false);
            }
            break;
    }
}

if (shoot_delay > 0) {
    shoot_delay--;
}

if (patrolling) {
    sprite_index = sprEWalkM16;
    image_speed = 1;

    var target_x = patrol_points[global.current_patrol_index][0];
    var target_y = patrol_points[global.current_patrol_index][1];

    var dir = point_direction(x, y, target_x, target_y);

    image_angle = dir;

    x += lengthdir_x(patrol_speed, dir);
    y += lengthdir_y(patrol_speed, dir);

    if (point_distance(x, y, target_x, target_y) < patrol_speed) {
        global.current_patrol_index++;
        if (global.current_patrol_index >= array_length(patrol_points)) {
            global.current_patrol_index = 0;
        }
    }
}

