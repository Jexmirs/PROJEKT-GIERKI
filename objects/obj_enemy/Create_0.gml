target_x = obj_Player.x;
target_y = obj_Player.y;

if (!variable_global_exists("grid")) {
    global.grid = mp_grid_create(0, 0, room_width / 8, room_height / 8, 8, 8);

   
    mp_grid_add_instances(global.grid, obj_Wall, false);
}

alarm[0] = 1;

function can_see_player() {
    var hit = collision_line(x, y, obj_Player.x, obj_Player.y, obj_Wall, false, true);
    return (hit == noone);
}

path = path_add();

see_player_shoot_delay = 0;
shoot_delay = 120;
shooted = false;
delay = 0;