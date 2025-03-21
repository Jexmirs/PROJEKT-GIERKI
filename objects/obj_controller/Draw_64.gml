var prev_font = draw_get_font();
var r  = keyboard_check(ord("R"));

score_text = string(global.current_score) + " pts";

if (global.show_clear_message) {
    var alpha_value = clamp(global.clear_timer / 120, 0, 1);
    
    draw_set_alpha(alpha_value);
    draw_set_color(c_white);
    draw_set_font(Font_Menue);
    draw_text_transformed(room_width / 2, room_height / 2, "FLOOR CLEARED!", 2, 2, 0);

    draw_set_alpha(1);

    global.clear_timer -= 1;

    if (global.clear_timer <= 0) {
        global.show_clear_message = false;
        global.clear_timer = 0;
    }

    draw_set_font(prev_font);
}

prev_font_restart = draw_get_font();

if(!instance_exists(obj_Player)) {
	draw_set_font(Font_Restart);
	draw_rectangle_color(_xx-1500, _yy+700, _xx-750, _yy+600, c_black, c_black, c_black, c_black, 0)
	draw_text(_xx - 1100, _yy+625, "Press R to Restart")
	if(r) {
		room_restart();	
	}
}

draw_set_font(prev_font_restart);

prev_font = draw_get_font();

draw_set_color(c_fuchsia);
draw_set_font(Font_Score);
draw_text(1150, 40, score_text);

draw_set_color(c_aqua);
draw_set_font(Font_Score);
draw_text(1150-5, 40-5, score_text);

draw_set_font(prev_font);