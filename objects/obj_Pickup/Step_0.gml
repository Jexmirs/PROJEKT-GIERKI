var player = instance_nearest(x, y, obj_Player);

if (player != noone && place_meeting(x, y, player) && keyboard_check_pressed(ord("E"))) {
    if (player.current_weapon == "none") {
        player.current_weapon = weapon_type;
        instance_destroy()
		obj_Player.sprite_index = sprPWalkUzi
    }
}

if (time < duration) {
	hover = ease_in_and_out(time, start, dest - start, duration)
	time++
} else {
	var tempStart = start;
	start = dest;
	dest = tempStart;
	time = 0;
}