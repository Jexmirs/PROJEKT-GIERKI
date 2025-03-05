if (collision_point(x, y, obj_enemy, false, true)) {
    with (other) {
        instance_create_layer(x, y, "Instances", obj_enemy_dead);  // Create obj_enemy_dead at the enemy's position
        instance_destroy();
    }

    instance_create_layer(x, y, "Instances", obj_dmgpoints);
    global.score += 400;

    var i;
    for (i = 0; i < 10; i++) {
        var blood_x = x + random_range(-20, 20);
        var blood_y = y + random_range(-20, 20);
        
        // Check if the location is free for placing blood splats
        if (!place_free(blood_x, blood_y) || 
            collision_point(blood_x, blood_y, obj_Wall, false, true) ||
            collision_point(blood_x, blood_y, obj_horizontaldoors, false, true) ||
            collision_point(blood_x, blood_y, obj_verticaldoors, false, true)) {
            continue;  // Skip if the place is not free
        }
        
        // Create the blood splat at the random position
        var blood = instance_create_layer(blood_x, blood_y, "Instances", obj_blood);
        
        // Randomly select a blood splat frame (using a number between 0 and 6, assuming 7 frames, 0-indexed)
        blood.image_index = irandom(6);  // irandom(6) will choose between 0 and 6
        
        // Randomize the size of the blood splat
        blood.image_scale = random_range(0.5, 3);
    }

    instance_destroy();
}
