var left = keyboard_check(ord("A"))
var right = keyboard_check(ord("D"))
var up = keyboard_check(ord("W"))
var down = keyboard_check(ord("S"))

var horizontalSpeed = right - left;
var verticalSpeed = down - up;

x += horizontalSpeed * walkSpeed;
y += verticalSpeed * walkSpeed;

if (mouse_check_button(mb_right)) {
	
	if (!instance_exists(obj_peek)) {
	lookcamera = instance_create_layer(mouse_x, mouse_y, "Instances", obj_peek)
	}
	lookcamera.x = clamp(mouse_x, x - 100, x + 100);
	lookcamera.y = clamp(mouse_y, y - 100, y + 100);
	
	lookcamera.timer = 5;
	obj_camera.target = lookcamera;
	
}