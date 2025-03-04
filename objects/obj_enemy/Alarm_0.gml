path = path_add();

target_x = obj_Player.x;
target_y = obj_Player.y;

if (!variable_global_exists("grid")) {
    global.grid = mp_grid_create(0, 0, room_width / 8, room_height / 8, 8, 8);
    mp_grid_add_instances(global.grid, obj_Wall, false);
}

var can_see_player = !collision_line(x, y, target_x, target_y, obj_Wall, false, true) &&
                     !collision_line(x, y, target_x, target_y, obj_verticaldoors, false, true) &&
                     !collision_line(x, y, target_x, target_y, obj_horizontaldoors, false, true);

if (can_see_player) {
    if (mp_grid_path(global.grid, path, x, y, target_x, target_y, false)) {
        path_start(path, 1.5, path_action_stop, false);
		image_angle = lerp(image_angle, point_direction(x, y, target_x, target_y), 0.1);
    }
}



alarm[0] = 40;
