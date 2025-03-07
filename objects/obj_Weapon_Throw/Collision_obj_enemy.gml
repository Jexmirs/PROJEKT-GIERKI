if (collision_point(x, y, obj_enemy, false, true)) {
    with (other) {
        instance_create_layer(x, y, "Instances", obj_enemy_unconscious);
        instance_destroy();
    }

    instance_create_layer(x, y, "Instances", obj_dmgpoints);
	var pickup = instance_create_layer(x,y, "Instances", obj_Pickup)
	pickup.sprite_index = sprite_index;
	instance_destroy();
    global.score += 400;

    instance_destroy();
}
