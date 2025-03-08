var prev_font = draw_get_font();
var r  = keyboard_check(ord("R"));

score_text = string(current_score) + " pts";

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

if(!instance_exists(obj_Player)) {
	draw_set_font(Font_Score);
	draw_rectangle_color(_xx-1500, _yy+700, _xx-750, _yy+600, c_black, c_black, c_black, c_black, 0)
	draw_text(_xx - 1000, _yy+650, "Press R to Restart")
	if(r) {
		room_restart();	
	}
}

prev_font = draw_get_font();

/*draw_rectangle_color(_xx-100, _yy-5, _xx+300, _yy+80, c_black, c_black, c_black, c_black, 0)

draw_set_font(Font_Score);
draw_text_ext_transformed_color(_xx-85, _yy, score_text, 200,200, 1.5, 1.5, wiggle, color3,color3,color3,color3, 1 );
draw_text_ext_transformed_color(_xx-85, _yy, score_text, 200,200, 1.5, 1.5, wiggle, color2,color2,color2,color2, 1 );
draw_text_ext_transformed_color(_xx-85-2, _yy-2, score_text, 200,100, 1.5, 1.5, wiggle, color,color,color,color, blink );

for (var i = 0; i < draw_Extra; i++ ) {
draw_text_ext_transformed_color(_xx-85+i, _yy,    score_text, 200,200, 1.5, 1.5, wiggle, color3,color3,color3,color3, 1 );
draw_text_ext_transformed_color(_xx-85+i, _yy,   score_text, 200,200, 1.5, 1.5, wiggle, color4,color4,color4,color4, 1 );
draw_text_ext_transformed_color(_xx-85+2+i, _yy-2,  score_text, 200,100, 1.5, 1.5, wiggle, color,color,color,color, blink );
} /*

draw_set_font(prev_font);