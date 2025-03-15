var text_1 = "ACT 3";
var scale = 5;
var posY_Selected = 1;
var spacing = 65;
var text_width = string_width(text_1) + (string_length(text_1) - 1) * spacing;
var start_x = (grabCamera_Width - text_width) + camera_get_view_x(view_camera[0]) + 275;
var start_y = grabCamera_Height + camera_get_view_y(view_camera[0]) - 260;

var x_offset = start_x;

draw_text_ext_transformed_color(x_offset, start_y + posY_Selected, text_1, 200, 200, scale, scale, wiggle, color, color, color, color, 1);

