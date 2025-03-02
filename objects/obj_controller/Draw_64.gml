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
