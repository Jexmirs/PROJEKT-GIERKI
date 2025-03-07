if (collision_point(x, y, obj_enemy, false, true)) {
    with (other) {
        instance_create_layer(x, y, "Instances", obj_enemy_dead);
        instance_destroy();
		audio_play_sound(Punch, 1, false);
    }

    instance_create_layer(x, y, "Score_Points", obj_dmgpoints);
    global.score += 400;

    var i;
    for (i = 0; i < 25; i++) {
        var blood_x = x + random_range(-20, 25);
        var blood_y = y + random_range(-20, 25);
        
        if (!place_free(blood_x, blood_y) || 
            collision_point(blood_x, blood_y, obj_Wall, false, true) ||
            collision_point(blood_x, blood_y, obj_horizontaldoors, false, true) ||
            collision_point(blood_x, blood_y, obj_verticaldoors, false, true)) {
            continue;
        }
        
        var blood = instance_create_layer(blood_x, blood_y, "Instances", obj_blood);
        blood.image_index = irandom(6);
        blood.image_scale = random_range(0.5, 10);
		image_speed = 0;
    }

    instance_destroy();
}
