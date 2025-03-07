

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


var reducedLength = angle_Length - 0.05;
var xx = x + lengthdir_x(reducedLength, angle);
var yy = y + lengthdir_y(angle_Length, angle);


var negativeAngle = angle - 180;
var xx2 = x + lengthdir_x(reducedLength, negativeAngle);
var yy2 = y + lengthdir_y(angle_Length, negativeAngle);
draw_set_font(Font_DmgPoints);


draw_text_transformed_color(xx,yy,  text, 2, 2, 0, textColor_Shadow, textColor_Shadow, textColor_Shadow, textColor_Shadow, 1);

draw_text_transformed_color(xx2,yy2,  text, 2, 2, 0, textColor_Front, textColor_Front, textColor_Front, textColor_Front, 1);