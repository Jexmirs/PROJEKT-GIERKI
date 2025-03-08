if (instance_number(obj_enemy) == 0 && !global.floor_cleared) {
    if (instance_exists(obj_Player)) {
        global.show_clear_message = true;
        global.clear_timer = 120;
        global.floor_cleared = true;
    }
}

if (instance_number(obj_Player) == 0) {
    global.show_restart_message = true;
    if (keyboard_check_pressed(ord("R"))) {
        room_restart();
		audio_stop_all()
    }
} else {
    global.show_restart_message = false;
}

if ( time < duration) { 
	
	blink = ease_in_and_out(time, start, dest - start, duration);
	time++;
	}
else { 
	
	var tempStart = start;
	start = dest;
	dest = tempStart;
	time = 0;
	}
	
	

if ( time2 < duration2) { 
	
	time2++;
	}
else { 
	
	var tempStart2 = start2;
	start2 = dest2;
	dest2 = tempStart2;
	time2 = 0;
	}
	
if (current_score < final_score) {
    current_score += ceil((final_score - current_score) / animation_speed);
}

final_score = c_score;