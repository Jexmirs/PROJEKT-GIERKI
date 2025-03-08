global.time += 1;

swing_offset = sin(global.time * swing_speed) * swing_amplitude;



if (global.can_skip && (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left))) {
    global.dialogue_index += 1;

    if (global.dialogue_index < array_length_1d(global.dialogues)) {
        global.full_dialog_text = global.dialogues[global.dialogue_index];
        global.dialog_text = "";
        global.text_timer = 0;
    }
    else {
        global.dialogue_index = 0;
        global.dialog_text = "";
        global.full_dialog_text = "";
		instance_create_layer(x, y, "Instances", obj_dialogue_player_01);
        instance_destroy();
    }
}

if (global.text_timer < string_length(global.full_dialog_text)) {
    global.text_timer += global.text_speed;
    global.dialog_text = string_copy(global.full_dialog_text, 1, global.text_timer);
} else {
    global.can_skip = true;
}

obj_Camera.target = obj_Assassin;