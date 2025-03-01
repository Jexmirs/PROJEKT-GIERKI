x = mouse_x;
y = mouse_y;

if (sprite_index == spr_cursor) {
    image_speed = 0.2;
    image_index += image_speed;
    if (image_index >= sprite_get_number(spr_cursor)) {
        image_index = 0;
    }
}