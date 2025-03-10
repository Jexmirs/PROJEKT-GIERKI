if (collision_point(x, y, obj_enemy, false, true)) {
    with (other) {
        instance_create_layer(x, y, "Instances", obj_enemy_unconscious);
        instance_destroy();
		audio_play_sound(Punch, 1, false);
    }
	global.current_score += 400;
    instance_create_layer(x, y, "Score_Points", obj_dmgpoints);
    instance_destroy();
}

