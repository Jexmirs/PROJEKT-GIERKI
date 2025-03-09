if (place_meeting(x, y, obj_Player)) {
    if (keyboard_check(ord("E"))) {
        obj_Player.image_alpha = 0;
        sprite_index = sprPAttackBash;
        image_speed = 0;
        image_index = 0;
		animation_delay = 0;
        global.attacking = true;
    }

    if (keyboard_check_pressed(vk_space)) {
        image_speed = 2;
    }
    
    if (animation_delay > 140 && global.attacking = true) {
        image_speed = 0;
        animation_delay = 0;
		kicked_head++;
    }
    
    if (kicked_head = 1 && !blood_spawned_1) {
        blood_spawned_1 = true;
        var i;
        for (i = 0; i < 15; i++) {
            var blood_angle = random_range(0, 15);
            var blood_speed = random_range(0.1, 3.5);

            var blood = instance_create_layer(x, y, "Instances", obj_blood);
            blood.image_index = irandom(7);
            blood.image_scale = random_range(0.5, 3);
            
            blood.direction = blood_angle;
            blood.speed = blood_speed;

            blood.lifetime = random_range(0.1, 15);
        }
    }
}

    if (kicked_head = 2 && !blood_spawned_2) {
        blood_spawned_2 = true;
        var i;
        for (i = 0; i < 15; i++) {
            var blood_angle = random_range(90, -90);
            var blood_speed = random_range(0.1, 3.5);

            var blood = instance_create_layer(x, y, "Instances", obj_blood);
            blood.image_index = irandom(7);
            blood.image_scale = random_range(0.5, 3);
            
            blood.direction = blood_angle;
            blood.speed = blood_speed;

            blood.lifetime = random_range(0.1, 15);
        }
    }

if (kicked_head == 3 && !blood_spawned_3) {
    blood_spawned_3 = true;
    obj_enemy_unconscious.sprite_index = sprEBackHeadbutt;
    obj_Player.image_alpha = 1;
    global.attacking = false;
    instance_create_layer(x, y, "Instances", obj_enemy_dead);
    
    var i;
    for (i = 0; i < 25; i++) {
        var blood_angle = random(360);
        var blood_speed = random_range(0.1, 1);

        var blood = instance_create_layer(x, y, "Instances", obj_blood);
        blood.image_index = irandom(7);
        blood.image_scale = random_range(0.5, 3);

        blood.direction = blood_angle;
        blood.speed = blood_speed;

        blood.lifetime = random_range(0.1, 30);
    }
}

if (obj_enemy_unconscious.image_speed > 0) {
    animation_delay++;
}