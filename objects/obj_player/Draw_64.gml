// draw_set_color(c_white);
// draw_text(120, 20, "Strzykawka: " + string(masks[mask]));

var _xx = 5;
var _yy = 650;

prev_font_ammo = draw_get_font();

if (current_weapon != "none" && current_weapon != "bat" && current_weapon != "knife" && current_weapon != "axe") {
    var color_start = make_color_rgb(204, 229, 255);
    var color_end = make_color_rgb(211, 243, 255);

    var weapon_sprite_height = sprite_get_height(splBullet_0) * 4;
    var weapon_scale = (220.0 / weapon_sprite_height);
    var weapon_y = _yy + 34.5;

    draw_sprite_ext(splBullet_0, 0, _xx, weapon_y, weapon_scale, weapon_scale, 0, c_white, 1);

	if(current_weapon = "shotgun") {
    var text_1 = string(ammo_shotgun);
	}
	if(current_weapon = "rifle") {
    var text_1 = string(ammo_rifle);
	}
	if(current_weapon = "pistol") {
    var text_1 = string(ammo_pistol);
	}
	if(current_weapon = "mp5") {
    var text_1 = string(ammo_mp5);
	}
	if(current_weapon = "uzi") {
    var text_1 = string(ammo_uzi);
	}
    draw_set_font(Font_Ammo);
    draw_set_color(c_red);

    var text_width = string_width(text_1);
    var text_x = _xx + 35 - (text_width * 1.5) / 2;

    draw_text_transformed(text_x + 25, _yy + 0, text_1, 3, 3, 0);
    
    draw_set_color(color_start);
    draw_set_font(Font_Ammo);
    draw_text_transformed(text_x + 25, _yy + 2, text_1, 3, 3, 0);
}


draw_set_font(Font_Ammo);