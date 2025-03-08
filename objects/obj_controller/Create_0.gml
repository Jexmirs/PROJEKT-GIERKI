window_set_fullscreen(true);

global.show_clear_message = false;
global.clear_timer = 0;
global.floor_cleared = false;

draw = false;

background_text_color = make_color_rgb(150, 150, 150);
text_color = make_color_rgb(204, 229, 255);
c_score = 0;
final_score = 0;
current_score = 0;
animation_speed = 100;
final_score = c_score;


_Width = 1000;
_Height = 75;
margin_top = 15;
margin_left = 1200;
_xx = margin_left;
_yy = margin_top;
background_offset = 12;

background_text_color = make_color_rgb(150, 150, 150);
text_color = make_color_rgb(204, 229, 255);

color = c_white;
color2 = c_aqua;
color3 = c_black;
color4 = c_navy;
start = 0;
dest =  1;
duration = 60;
time = 0;
score_animation_timer = 0;


blink = 0;


start2 = -5;
dest2 =  5;
duration2 = 120;
time2 = 0;

wiggle = 0;


animateTime = 10;
draw_Extra = 0;
draw_ExtraMax = 8;
Increase = true; 

alarm[0] = animateTime;
