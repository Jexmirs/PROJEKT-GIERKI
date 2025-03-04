// draw_set_color(c_white);
// draw_text(120, 20, "Strzykawka: " + string(masks[mask]));

var margin_left = 5;
var margin_bottom = 650;

if (current_weapon != "none") {
	var _xx = margin_left;
	var _yy = margin_bottom;

    
    var color_start = make_color_rgb(204, 229, 255);
    var color_end = make_color_rgb(211, 243, 255);

    var weapon_sprite_height = sprite_get_height(splBullet_0) * 4;
    var weapon_scale = (124.0 / weapon_sprite_height);
    var weapon_y = _yy + 52.5;

    draw_sprite_ext(splBullet_0, 0, _xx, weapon_y, weapon_scale, weapon_scale, 0, c_white, 1);

    var text_1 = string(ammo_rifle);
    draw_set_font(Font_Menue);
    draw_set_color(c_red);
    draw_text_transformed(_xx + 20, _yy + 30, text_1, 2, 2, 0);
    
    draw_set_color(color_start);
    draw_set_font(Font_Menue);
    draw_text_transformed(_xx + 20, _yy + 30 + 2, text_1, 2, 2, 0);
}