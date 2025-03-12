global.stand_delay--;
if (global.stand_delay < 0 && !attacking) {
    sprite_index = sprEGetUp;
    global.standed = true;
    global.standed_delay--;
}

if (image_index > 6) {
    image_speed = 0;
}

if (global.standed == true && global.standed_delay < 0 && !attacking) {
    var new_enemy = instance_create_layer(x, y, "Instances", obj_enemy);

    if (instance_exists(new_enemy)) {
        new_enemy.enemy_current_weapon = "none";
        new_enemy.patrol_points = [
            [392, 382],
            [250, 373],
            [250, 226],
            [3, 233]
        ];
        new_enemy.is_unconscious = true;
        new_enemy.idling = false;
        new_enemy.patrolling = false;
        new_enemy.target_pickup = noone;
        new_enemy.idle = "standing";
    }

    instance_destroy();
}

if (place_meeting(x, y, obj_Player)) {
    var nearest_enemy = undefined;
    var nearest_distance = 999999;
    with (obj_enemy_unconscious) {
        var dist = point_distance(x, y, obj_Player.x, obj_Player.y);
        if (dist < nearest_distance) {
            nearest_enemy = id;
            nearest_distance = dist;
        }
    }


    if (nearest_enemy != undefined) {
        var enemy_instance = nearest_enemy;
        
        if (keyboard_check(ord("E"))) {
            obj_Player.image_alpha = 0;
            sprite_index = sprPAttackBash;
            image_speed = 0;
            image_index = 0;
            animation_delay = 0;
            global.attacking = true;
			attacking = true;

            if (instance_exists(enemy_instance)) {
                var enemy = enemy_instance;
                
                if (enemy.is_unconscious) {
                    enemy.is_unconscious = false;
                    enemy.sprite_index = sprEGetUp;
                    enemy.idling = true;
                    enemy.image_index = 0;
                    enemy.image_speed = 0.2;
                }

                if (kicked_head == 1 && !blood_spawned_1) {
                    blood_spawned_1 = true;
                    var i;
                    for (i = 0; i < 15; i++) {
                        var blood_angle = random_range(0, 15);
                        var blood_speed = random_range(0.1, 3.5);

                        var blood = instance_create_layer(x, y, "Instances", obj_blood_splash);
                        blood.image_index = irandom(7);
                        blood.image_scale = random_range(0.5, 3);

                        blood.direction = blood_angle;
                        blood.speed = blood_speed;

                        blood.lifetime = random_range(0.1, 15);
                    }
                }
            }
        }
    }

    if (keyboard_check_pressed(vk_space)) {
        image_speed = 2;
    }

    if (animation_delay > 140 && global.attacking == true) {
        image_speed = 0;
        animation_delay = 0;
        kicked_head++;
    }

    if (kicked_head == 1 && !blood_spawned_1) {
        blood_spawned_1 = true;
        var i;
        for (i = 0; i < 15; i++) {
            var blood_angle = random_range(0, 15);
            var blood_speed = random_range(0.1, 3.5);

            var blood = instance_create_layer(x, y, "Instances", obj_blood_splash);
            blood.image_index = irandom(7);
            blood.image_scale = random_range(0.5, 3);

            blood.direction = blood_angle;
            blood.speed = blood_speed;

            blood.lifetime = random_range(0.1, 15);
        }
    }

    if (kicked_head == 2 && !blood_spawned_2) {
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
}

if (instance_exists(obj_enemy_unconscious) && obj_enemy_unconscious.image_speed > 0) {
    animation_delay++;
}
