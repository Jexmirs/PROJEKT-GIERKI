if (collision_point(x, y, obj_enemy, false, true)) {
    with (other) {
        instance_create_layer(x, y, "Instances", obj_enemy_dead);
        instance_destroy();
		audio_play_sound(Punch, 1, false);
    }

    instance_create_layer(x, y, "Score_Points", obj_dmgpoints);
    global.score += 400;

    instance_destroy();
}
