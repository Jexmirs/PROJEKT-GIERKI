var can_see_player = (point_distance(x, y, obj_player.x, obj_player.y) < vision_range) &&
                      !collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, false);

switch (state) {
    case AIState.IDLE:
        if (can_see_player) {
            state = AIState.CHASING;
        } else {
            state = AIState.ROAMING;
            roam_random();
        }
        break;

    case AIState.ROAMING:
        if (can_see_player) {
            state = AIState.CHASING;
        }
        if (path_position == 1) {
            roam_random();
        }
        break;

    case AIState.CHASING:
        if (can_see_player) {
            chase_player();
        } else {
            state = AIState.SEARCHING;
            search_timer = search_time;
        }
        break;

    case AIState.SEARCHING:
        search_timer -= 1;
        if (search_timer <= 0) {
            state = AIState.IDLE;
        } else {
            roam_random();
        }
        break;
}

function roam_random() {
    if (move_delay > 0) {
        move_delay -= 1;
        return;
    }
    
    var target_distance = irandom_range(50, 150);
    var new_x = x + lengthdir_x(target_distance, irandom_range(0, 360));
    var new_y = y + lengthdir_y(target_distance, irandom_range(0, 360));
    
    new_x = clamp(new_x, 32, room_width - 32);
    new_y = clamp(new_y, 32, room_height - 32);
    
    if (mp_grid_path(global.grid, path, x, y, new_x, new_y, false)) {
        path_start(path, speed_normal, path_action_stop, false);
        move_delay = irandom_range(30, 60);
    } else {
        roam_random();
    }
}

function chase_player() {
    if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, false)) {
        path_start(path, speed_chase, path_action_stop, false);
    }
}
