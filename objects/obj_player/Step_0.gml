var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

var horizontalSpeed = right - left;
var verticalSpeed = down - up;

h_speed = lerp(h_speed, horizontalSpeed * walkSpeed, acceleration);

v_speed = lerp(v_speed, verticalSpeed * walkSpeed, acceleration);

x += h_speed;
y += v_speed;
