var gradient_width = szerokosc * 0.3;
var offset_x = 50;
var start_y = pasek_wysokosc + 3;
var end_y = wysokosc - pasek_wysokosc - 3;

var rectangle_x = (szerokosc - gradient_width - offset_x) + 20;
var rectangle_y = start_y; 
var rectangle_width = gradient_width;
var rectangle_height = end_y - start_y;

draw_set_color(c_white);
draw_rectangle(0 - 2, 0 - 2, szerokosc + 2, pasek_wysokosc + 2, false);
draw_rectangle(0 - 2, wysokosc - pasek_wysokosc - 2, szerokosc + 2, wysokosc + 2, false);

draw_set_color(c_black);
draw_rectangle(0, 0, szerokosc, pasek_wysokosc, false);
draw_rectangle(0, wysokosc - pasek_wysokosc, szerokosc, wysokosc, false);

draw_set_alpha(1);
draw_set_color(c_white);

draw_rectangle(szerokosc - gradient_width - offset_x - 2, start_y - 2, szerokosc - 465, end_y + 2, false);

draw_set_alpha(0.1);
var pink_color = c_fuchsia;
draw_set_color(pink_color);
draw_rectangle(szerokosc - gradient_width - offset_x, start_y, szerokosc, end_y, false);

draw_set_alpha(1);

var portrait_x = rectangle_x + (rectangle_width - portrait_width) / 2;
var portrait_y = rectangle_y + (rectangle_height - portrait_height) / 2;


draw_sprite(portrait_image, 0, portrait_x + swing_offset, portrait_y);

draw_set_color(c_black);
draw_text(dialog_text_x - 1, dialog_text_y - 1, global.dialog_text);
draw_text(dialog_text_x + 1, dialog_text_y - 1, global.dialog_text);
draw_text(dialog_text_x - 1, dialog_text_y + 1, global.dialog_text);
draw_text(dialog_text_x + 1, dialog_text_y + 1, global.dialog_text);

draw_set_color(text_color);
draw_text(dialog_text_x, dialog_text_y, global.dialog_text);

if (global.can_skip) {
    var skip_text = "Press 'Space' to skip";
    draw_set_color(c_black);
    draw_text(skip_text_x - 1, skip_text_y - 1, skip_text);
    draw_text(skip_text_x + 1, skip_text_y - 1, skip_text);
    draw_text(skip_text_x - 1, skip_text_y + 1, skip_text);
    draw_text(skip_text_x + 1, skip_text_y + 1, skip_text);

    draw_set_color(text_color);
    draw_text(skip_text_x, skip_text_y, skip_text);
}
