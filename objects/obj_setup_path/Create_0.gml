grid = mp_grid_create(0, 0, room_width / 8, room_height / 8	,8, 8);

mp_grid_add_instances(grid, obj_Wall, 0);
mp_grid_add_instances(grid, obj_verticaldoors, 0);
mp_grid_add_instances(grid, obj_horizontaldoors, 0);
