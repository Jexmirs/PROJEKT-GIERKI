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