if (show_controls) {
var rect_x = 20;
var rect_y = 20;
var rect_w = 450;
var rect_h = 120;

draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(rect_x, rect_y, rect_x + rect_w, rect_y + rect_h, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var controls_text = "Sterowanie:\n" +
                    "WASD - Ruch\n" +
					"E - Interakcja\n" +
                    "LPM - Atak/Strzal\n" +
                    "PPM - Podnoszenie/rzucanie broni\n";

draw_text(rect_x + 10, rect_y + 10, controls_text);
draw_sprite(cheetosjumbo, 0, rect_x + 400, rect_y + 50);
}