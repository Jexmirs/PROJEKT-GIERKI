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
var targetX = obj_player.x - (display_get_width() / 2);
var targetY = obj_player.y - (display_get_height() / 2);

// Zastosowanie lerp do płynnego podążania kamery
view_xview[0] = lerp(view_xview[0], targetX, camSpeed);
view_yview[0] = lerp(view_yview[0], targetY, camSpeed);

// Ograniczenie kamery, aby nie wychodziła poza granice pokoju
view_xview[0] = clamp(view_xview[0], 0, room_width - display_get_width());
view_yview[0] = clamp(view_yview[0], 0, room_height - display_get_height());
