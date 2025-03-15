var text_1 = "Game Finishedd";
var scale = 6;
var posY_Selected = 1;
var spacing = 60;
var text_width = string_width(text_1) + (string_length(text_1) - 1) * spacing;
var start_x = (grabCamera_Width - text_width) + camera_get_view_x(view_camera[0]) + 450;
var start_y = grabCamera_Height + camera_get_view_y(view_camera[0]) - 200;

var x_offset = start_x;

for (var i = 1; i < string_length(text_1); i++) {
    var letter = string_char_at(text_1, i); 
    var letter_width = string_width(letter) + spacing;
    var colorToUse = color;

    if (i == current_Letter) {
        for (var j = 0; j < draw_Extra; j++) {
            draw_text_ext_transformed_color(x_offset + j, start_y + posY_Selected, letter, 200, 200, scale, scale, wiggle, color2, color, color, color, 1);
			delay++;
        }
    } else {
        draw_text_ext_transformed_color(x_offset, start_y + posY_Selected, letter, 200, 200, scale, scale, wiggle, colorToUse, colorToUse, colorToUse, colorToUse, 1);
    }

    x_offset += letter_width;
}
