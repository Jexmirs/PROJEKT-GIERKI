var grabCamera_X = 0;
var grabCamera_Y = 0;

var grabCamera_Width  = display_get_width();
var grabCamera_Height = display_get_height();

var buffer_ = 60;

hue += 0.2;
if (hue > 255) { hue = 0; }

color1 = make_color_hsv(hue, 120, 120);

draw_rectangle_color(grabCamera_X - buffer_, grabCamera_Y - buffer_, 
                     grabCamera_Width + buffer_, grabCamera_Height + buffer_,
                     color1, color1, color2, color2, 0);
