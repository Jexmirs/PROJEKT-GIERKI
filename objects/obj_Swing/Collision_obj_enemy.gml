if (collision_point(x, y, obj_enemy, false, true)) {
    with (other) {
        instance_create_layer(x, y, "Instances", obj_enemy_dead);
        instance_destroy();
		audio_play_sound(Punch, 1, false);
    }

    instance_create_layer(x, y, "Score_Points", obj_dmgpoints);
    global.score += 400;

    var i;
    for (i = 0; i < 35; i++) {
            var blood_angle = random(360);
            var blood_speed = random_range(0.1, 3.5);

            var blood = instance_create_layer(x, y, "Instances", obj_blood);
            blood.image_index = irandom(7);
            blood.image_scale = random_range(0.5, 3);
            
            blood.direction = blood_angle;
            blood.speed = blood_speed;

            blood.lifetime = random_range(0.1, 10);
		image_speed = 0;
    }

    instance_destroy();
}
