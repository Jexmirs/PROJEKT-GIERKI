if (collision_point(x, y, obj_enemy, false, true)) {
    with (other) {
        instance_create_layer(x, y, "Instances", obj_enemy_dead);
        instance_destroy();
    }
	instance_create_layer(obj_enemy_dead.x,obj_enemy_dead.y - 5, "Instances", obj_blood_pool);
    instance_create_layer(x, y, "Score_Points", obj_dmgpoints);
    global.score += 400;

        var i;
        for (i = 0; i < 15; i++) {
            var blood_angle = random_range(90, -90);
            var blood_speed = random_range(0.1, 3.5);

            var blood = instance_create_layer(x, y, "Instances", obj_blood);
            blood.image_index = irandom(7);
            blood.image_scale = random_range(0.5, 3);
            
            blood.direction = blood_angle;
            blood.speed = blood_speed;

            blood.lifetime = random_range(0.1, 5);
    }

    instance_destroy();
}
