if (!variable_global_exists("grid")) {
    global.grid = mp_grid_create(0, 0, room_width div 32, room_height div 32, 32, 32);
    mp_grid_add_instances(global.grid, obj_wall, false);
}

enum AIState { IDLE, ROAMING, CHASING, SEARCHING }
state = AIState.IDLE;

path = path_add();
vision_range = 200;
search_time = 120;
search_timer = 0;
speed_normal = 1.5;
speed_chase = 3.5;

move_delay = 0;
move_delay_range = irandom_range(30, 60);