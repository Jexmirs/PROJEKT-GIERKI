target_x = obj_Player.x;
target_y = obj_Player.y;

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
global.going_to_weapon = false;
global.picked_weapon = false;

legs_image_index = 0;
legs_image_speed = 1;
