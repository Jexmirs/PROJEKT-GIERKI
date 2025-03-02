var enemy_speed = 2;

if (!collision_line(x, y, obj_Player.x, obj_Player.y, obj_Wall, true, true) && 
    !collision_line(x, y, obj_Player.x, obj_Player.y, obj_verticaldoors, true, true) && 
    !collision_line(x, y, obj_Player.x, obj_Player.y, obj_horizontaldoors, true, true)) {

    move_towards_point(obj_Player.x, obj_Player.y, enemy_speed);
    image_speed = 1;
    image_angle = point_direction(x, y, obj_Player.x, obj_Player.y); // Poprawiony sposób ustawienia kąta
} else {
    image_speed = 0;
}
