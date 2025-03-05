
if (collision_point(x, y, obj_enemy, false, true)) {
    with (other) {
        instance_create_layer(x, y, "Instances", obj_enemy_dead);  // Tworzymy obj_enemy_dead w miejscu obj_enemy
        instance_destroy();
    }

    instance_create_layer(x, y, "Instances", obj_dmgpoints);
	instance_create_layer(x, y, "Instances_1", obj_Pickup);
    global.score += 400;

    var i;
    for (i = 0; i < 10; i++) {
        var blood_x = x + random_range(-20, 20);
        var blood_y = y + random_range(-20, 20);
        
        if (!place_free(blood_x, blood_y) || 
            collision_point(blood_x, blood_y, obj_Wall, false, true) ||
            collision_point(blood_x, blood_y, obj_horizontaldoors, false, true) ||
            collision_point(blood_x, blood_y, obj_verticaldoors, false, true)) {
            continue;
        }
        
        var blood = instance_create_layer(blood_x, blood_y, "Instances", obj_blood);
        blood.image_index = irandom(7);
        blood.image_scale = random_range(0.5, 3);
    }

    instance_destroy();
}
