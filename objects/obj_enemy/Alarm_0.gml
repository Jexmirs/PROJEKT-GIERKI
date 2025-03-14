path = path_add();

if (instance_exists(obj_Player)) {
    target_x = obj_Player.x;
    target_y = obj_Player.y;
} else {
    path_end();
}

image_speed = 0;

if (!variable_global_exists("grid")) {
    global.grid = mp_grid_create(0, 0, room_width / 8, room_height / 8, 8, 8);
    mp_grid_add_instances(global.grid, obj_Wall, false);
}
var can_see_player = !collision_line(x, y, target_x, target_y, obj_Wall, false, true) &&
                     !collision_line(x, y, target_x, target_y, obj_verticaldoors, false, true) &&
                     !collision_line(x, y, target_x, target_y, obj_horizontaldoors, false, true);

if (can_see_player && enemy_current_weapon != "none") {
    global.going_to_weapon = false;
    if (mp_grid_path(global.grid, path, x, y, target_x, target_y, true)) {
        path_start(path, 1.5, path_action_stop, false);
        image_angle = lerp(image_angle, point_direction(x, y, target_x, target_y), 0.1);
        image_speed = 1;
        see_player_shoot_delay++;
        patrolling = false;
        idling = false;

			if(!idling) {
            switch (enemy_current_weapon) {
                case "m16":
                    sprite_index = sprEWalkM16;
                    image_angle = point_direction(x, y, target_x, target_y);
					image_speed = 0;
                    break;
                case "bat":
                    sprite_index = sprEWalkBat;
                    image_angle = point_direction(x, y, target_x, target_y);
					image_speed = 0;
                    break;
            }
		}
    }
}

var path_end_timer_max = 360;
if (!variable_global_exists("path_end_timer")) {
    global.path_end_timer = path_end_timer_max;
}

if (!can_see_player) {
    global.path_end_timer--;
    if (global.path_end_timer <= 0) {
        path_end();
        path_position = 0;
        path_speed = 0;
        hspeed = 0;
        vspeed = 0;
        speed = 0;
        image_speed = 0;
    }
} else {
    global.path_end_timer = path_end_timer_max;
}



	
var nearest_pickup = instance_nearest(x, y, obj_Pickup);

if (variable_instance_exists(self, "is_unconscious") && is_unconscious) {
    global.going_to_weapon = true;
    if (global.stand_delay < 0 && instance_exists(nearest_pickup)) {
        var distance_to_pickup = distance_to_object(nearest_pickup);

        if (global.picked_weapon == false && nearest_pickup != undefined) {
			if (mp_grid_path(global.grid, path, x, y, nearest_pickup.x, nearest_pickup.y, true)) {
			path_start(path, 1.5, path_action_stop, false);
			image_angle = point_direction(x, y, nearest_pickup.x, nearest_pickup.y)
        }	
		}
    }
}

if (global.going_to_weapon && can_see_player) {
    global.going_to_weapon = false;
}

if(global.picked_weapon = true && !can_see_player) {
	idling = false;
}

alarm[0] = 45;
