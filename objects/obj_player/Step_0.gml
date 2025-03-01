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


if (keyboard_check_pressed(vk_left)) {
    current_mask = (current_mask - 1 + array_length(masks)) mod array_length(masks);
}
if (keyboard_check_pressed(vk_right)) {
    current_mask = (current_mask + 1) mod array_length(masks);
}

switch (masks[current_mask]) {
    case "Tony":
        break;
    case "Rasmus":
        break;
    case "Don Juan":
        break;
}

// Prędkość kamery
var camSpeed = 0.1; // Możesz dostosować tę wartość, aby uzyskać bardziej płynne poruszanie się kamery

// Pozycja celu kamery - chcemy wycentrować kamerę na graczu
var targetX = obj_Player.x - (display_get_width() / 2);
var targetY = obj_Player.y - (display_get_height() / 2);

// Zastosowanie lerp do płynnego podążania kamery
view_xview[0] = lerp(view_xview[0], targetX, camSpeed);
view_yview[0] = lerp(view_yview[0], targetY, camSpeed);

// Ograniczenie kamery, aby nie wychodziła poza granice pokoju
view_xview[0] = clamp(view_xview[0], 0, room_width - display_get_width());
view_yview[0] = clamp(view_yview[0], 0, room_height - display_get_height());

if (fire_timer > 0) {
    fire_timer--;
}

// Strzelanie
if (mouse_check_button(mb_left) && fire_timer == 0) {
    fire_timer = fire_rate;
    shoot();
}

// Zmiana broni
if (keyboard_check_pressed(ord("1"))) weapon_type = "pistol";
if (keyboard_check_pressed(ord("2")) && has_melee) weapon_type = "melee";
if (keyboard_check_pressed(ord("3")) && has_grenade) weapon_type = "grenade";
if (keyboard_check_pressed(ord("4")) && has_shotgun) weapon_type = "shotgun";
if (keyboard_check_pressed(ord("5")) && has_rifle) weapon_type = "rifle";


function shoot() {
    var bullet;
    switch (weapon_type) {
        case "pistol":
            bullet = instance_create_layer(x, y, "Instances", obj_bullet);
            bullet.direction = point_direction(x, y, mouse_x, mouse_y);
            bullet.image_angle = bullet.direction;
            bullet.speed = 10;
            fire_rate = 15;
            break;

        case "shotgun":
            for (var i = -10; i <= 10; i += 5) {
                bullet = instance_create_layer(x, y, "Instances", obj_bullet);
                bullet.direction = point_direction(x, y, mouse_x, mouse_y) + i;
                bullet.image_angle = bullet.direction;
                bullet.speed = 8;
            }
            fire_rate = 30;
            break;

        case "rifle":
            bullet = instance_create_layer(x, y, "Instances", obj_bullet);
            bullet.direction = point_direction(x, y, mouse_x, mouse_y);
            bullet.image_angle = bullet.direction;
            bullet.speed = 12;
            fire_rate = 5;
            break;
    }
}

if (keyboard_check(vk_shift)) {
	
	if (!instance_exists(obj_TargetDummy)) {  
		   targetDummy = instance_create_layer(mouse_x, mouse_y, "Instances", obj_TargetDummy);
                 obj_Camera.target = targetDummy;
		}
		var grabCamera_Width  = camera_get_view_width(view_camera[0]);
        var grabCamera_Height = camera_get_view_height(view_camera[0]);
		targetDummy.x = clamp(mouse_x,  x - ((grabCamera_Width/2)  -20) , x + ((grabCamera_Width/2)  -20)   ); 
		targetDummy.y = clamp(mouse_y,  y - ((grabCamera_Height/2) -20) , y + ((grabCamera_Height/2) -20)  );		

     obj_TargetDummy.timer = 5;
}