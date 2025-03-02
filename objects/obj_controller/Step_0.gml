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
