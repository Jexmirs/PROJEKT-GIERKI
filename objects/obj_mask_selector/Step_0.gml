if (keyboard_check_pressed(vk_up)) {
    current_mask = (current_mask - 1 + array_length(masks)) mod array_length(masks);
}

if (keyboard_check_pressed(vk_down)) {
    current_mask = (current_mask + 1) mod array_length(masks);
}

if (keyboard_check_pressed(vk_enter)) {
    selected_mask = current_mask;
    
    var player = instance_find(obj_player, 0);
    if (player != noone) {
        player.mask = selected_mask;
    }

    instance_destroy(); 
}
