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

var final_score = global.score;
var current_score = 0;
var animation_speed = 10;
var _Width = 1000; 
var _Height = 75;
var margin_top = 15; 
var margin_left = 1200;
var text_color = make_color_rgb(204, 229, 255);
var _xx = margin_left;
var _yy = margin_top;
var score_text = string(round(current_score)) + "pts";


var background_text_color = make_color_rgb(150, 150, 150);
var background_offset = 12;


if (current_score < final_score) {
    current_score += animation_speed;
    if (current_score > final_score) {
        current_score = final_score;
    }
}

draw_set_color(background_text_color);
draw_set_font(Font_Score);
draw_text_transformed(_xx + background_offset, _yy + background_offset, score_text, 1, 1, 0);

draw_set_color(text_color);
draw_set_font(Font_Score);
draw_text_transformed(_xx + 5, _yy + 10, score_text, 1, 1, 0);

