// draw_set_color(c_white);
// draw_text(120, 20, "Strzykawka: " + string(masks[mask]));

var _xx = 5;
var _yy = 650;


if (current_weapon != "none" && current_weapon != "bat") {
    var color_start = make_color_rgb(204, 229, 255);
    var color_end = make_color_rgb(211, 243, 255);

    var weapon_sprite_height = sprite_get_height(splBullet_0) * 4;
    var weapon_scale = (220.0 / weapon_sprite_height);
    var weapon_y = _yy + 34.5;

    draw_sprite_ext(splBullet_0, 0, _xx, weapon_y, weapon_scale, weapon_scale, 0, c_white, 1);

    var text_1 = string(ammo_rifle);
    draw_set_font(Font_Score);
    draw_set_color(c_red);

    var text_width = string_width(text_1);
    var text_x = _xx + 35 - (text_width * 1.5) / 2;

    draw_text_transformed(text_x + 25, _yy + 0, text_1, 3, 3, 0);
    
    draw_set_color(color_start);
    draw_set_font(Font_Score);
    draw_text_transformed(text_x + 25, _yy + 2, text_1, 3, 3, 0);
}
