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
}

if (global.show_restart_message) {
    var _x = 100;
    var _y = room_height - 30; 

    draw_text(_x, _y, "Press R to restart");
}

draw = false;

if (!draw) {
    if (!variable_global_exists("score")) {
        global.score = 0;
    }
    draw = true;
}

var _Width = 200;
var _Height = 100;
var margin_top = 5;
var margin_left = 1270;

var _xx = margin_left;
var _yy = margin_top;

var color_start = make_color_rgb(204, 229, 255);
var color_end = make_color_rgb(211, 243, 255);

draw_set_color(c_red);
draw_set_font(Font_Menue);
draw_text_transformed(_xx + 15, _yy + 10 + 2, string(global.score) + "pts", 1, 1, 0);

draw_set_font(Font_Menue);
draw_set_color(color_start);
draw_text_transformed(_xx + 15, _yy + 10, string(global.score) + "pts" , 1, 1, 0);