if (!variable_global_exists("grid")) {
    global.grid = mp_grid_create(0, 0, room_width div 32, room_height div 32, 32, 32);
    mp_grid_add_instances(global.grid, obj_wall, false);
}

if (!variable_global_exists("chasing_team")) {
    global.chasing_team = [];
}

function can_see_player() {
    var distance_to_player = point_distance(x, y, obj_Player.x, obj_Player.y);
    if (distance_to_player > vision_range) {
        return false;
    }
    
    var buffer_distance = 10;
    var start_x = x + lengthdir_x(buffer_distance, direction);
    var start_y = y + lengthdir_y(buffer_distance, direction);
    var end_x = obj_Player.x + lengthdir_x(buffer_distance, point_direction(obj_Player.x, obj_Player.y, x, y));
    var end_y = obj_Player.y + lengthdir_y(buffer_distance, point_direction(obj_Player.x, obj_Player.y, x, y));
    
    return !collision_line(start_x, start_y, end_x, end_y, obj_wall, false, false);
}

switch (state) {
    case AIState.IDLE:
        if (can_see_player()) {
            state = AIState.CHASING;
            join_chase();
        } else {
            state = AIState.ROAMING;
            roam_random();
        }
        break;

    case AIState.ROAMING:
        if (can_see_player()) {
            state = AIState.CHASING;
            join_chase();
        }
        if (path_position == 1) roam_random();
        break;

    case AIState.CHASING:
        if (can_see_player()) {
            var distance_to_player = point_distance(x, y, obj_Player.x, obj_Player.y);
            speed_current = (distance_to_player < 100) ? speed_chase * 1.5 : speed_chase;

            apply_separation();

            if (distance_to_player < 50) {
                speed_current = speed_chase * 0.75;
                var target_angle = point_direction(x, y, obj_Player.x, obj_Player.y);
                var random_offset = irandom_range(-10, 10);
                move_towards_point(obj_Player.x + lengthdir_x(random_offset, target_angle), 
                                   obj_Player.y + lengthdir_y(random_offset, target_angle), speed_current);
            } else {
                var erratic_offset = irandom_range(-5, 5);
                var target_x = obj_Player.x + erratic_offset;
                var target_y = obj_Player.y + irandom_range(-5, 5);
                move_towards_point(target_x, target_y, speed_current);
            }
        } else {
            state = AIState.SEARCHING;
            search_timer = search_time;
        }
        break;

    case AIState.SEARCHING:
        search_timer--;
        if (search_timer <= 0) state = AIState.IDLE;
        else roam_random();
        break;
}

global.roam_attempts = 0;
global.max_roam_attempts = 10;

function roam_random() {
    // Initialize global variables if not already set
    if (!variable_global_exists("roam_attempts")) {
        global.roam_attempts = 0;
    }
    if (!variable_global_exists("max_roam_attempts")) {
        global.max_roam_attempts = 10;
    }

    if (move_delay > 0) {
        move_delay--;
        return;
    }

    if (global.roam_attempts >= global.max_roam_attempts) {
        return;
    }

    var new_x = x + lengthdir_x(irandom_range(50, 150), irandom_range(0, 360));
    var new_y = y + lengthdir_y(irandom_range(50, 150), irandom_range(0, 360));
    
    new_x = clamp(new_x, 32, room_width - 32);
    new_y = clamp(new_y, 32, room_height - 32);

    if (mp_grid_path(global.grid, path, x, y, new_x, new_y, false)) {
        path_start(path, speed_current, path_action_stop, false);
        move_delay = irandom_range(30, 60);
        global.roam_attempts = 0;
    } else {
        global.roam_attempts++;
        roam_random();
    }
}


function join_chase() {
    if (!array_contains(global.chasing_team, id)) {
        array_push(global.chasing_team, id);
    }

    for (var i = 0; i < array_length(global.chasing_team); i++) {
        var enemy_instance = global.chasing_team[i];
        if (enemy_instance && enemy_instance.state != AIState.CHASING) {
            enemy_instance.state = AIState.CHASING;
            enemy_instance.chase_player();
        }
    }
}

function chase_player() {
    var target_x = obj_Player.x;
    var target_y = obj_Player.y;

    if (mp_grid_path(global.grid, path, x, y, target_x, target_y, false)) {
        path_start(path, speed_current, path_action_stop, false);
    }
}

function apply_separation() {
    var avoidance_radius = 50;
    var separation_force = 10;
    var separation_x = 0;
    var separation_y = 0;

    for (var i = 0; i < array_length(global.chasing_team); i++) {
        var enemy_instance = global.chasing_team[i];
        if (enemy_instance != id) {
            var distance_to_enemy = point_distance(x, y, enemy_instance.x, enemy_instance.y);
            
            if (distance_to_enemy < avoidance_radius) {
                var angle_to_enemy = point_direction(x, y, enemy_instance.x, enemy_instance.y);
                var push_x = lengthdir_x(separation_force, angle_to_enemy + 180);
                var push_y = lengthdir_y(separation_force, angle_to_enemy + 180);
                
                separation_x += push_x;
                separation_y += push_y;
            }
        }
    }

    x += separation_x;
    y += separation_y;
}
