if (!instance_exists(global.target_enemy)) {
    global.target_enemy = id;
}

if (global.target_enemy != id) {
    global.stand_delay--;
    if(global.stand_delay < 0) {
        sprite_index = sprEGetUp;
        global.standed = true;
        global.standed_delay--;
    }
}

if(image_index > 6) {
    image_speed = 0;    
}

if (global.target_enemy != id && global.standed == true && global.standed_delay < 0) {
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

if (place_meeting(x, y, obj_Player) && global.target_enemy == id) {
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

    if (animation_delay > 140 && global.attacking) {
        image_speed = 0;
        animation_delay = 0;
        kicked_head++;
    }

    if (kicked_head == 1 && !blood_spawned_1) {
        blood_spawned_1 = true;
        for (var i = 0; i < 15; i++) {
            var blood = instance_create_layer(x, y, "Instances", obj_blood_splash);
            blood.image_index = irandom(7);
            blood.image_scale = random_range(0.5, 3);
            blood.direction = random_range(0, 15);
            blood.speed = random_range(0.1, 3.5);
            blood.lifetime = random_range(0.1, 15);
        }
    }

    if (kicked_head == 2 && !blood_spawned_2) {
        blood_spawned_2 = true;
        for (var i = 0; i < 15; i++) {
            var blood = instance_create_layer(x, y, "Instances", obj_blood);
            blood.image_index = irandom(7);
            blood.image_scale = random_range(0.5, 3);
            blood.direction = random_range(-90, 90);
            blood.speed = random_range(0.1, 3.5);
            blood.lifetime = random_range(0.1, 15);
        }
    }

    if (kicked_head == 3 && !blood_spawned_3) {
        blood_spawned_3 = true;
        obj_enemy_unconscious.sprite_index = sprEBackHeadbutt;
        obj_Player.image_alpha = 1;
        global.attacking = false;
        instance_create_layer(x, y, "Instances", obj_enemy_dead);

        for (var i = 0; i < 25; i++) {
            var blood = instance_create_layer(x, y, "Instances", obj_blood);
            blood.image_index = irandom(7);
            blood.image_scale = random_range(0.5, 3);
            blood.direction = random(360);
            blood.speed = random_range(0.1, 1);
            blood.lifetime = random_range(0.1, 30);
			instance_destroy();
        }

        global.target_enemy = id;
    }
}

if (instance_exists(obj_enemy_unconscious) && obj_enemy_unconscious.image_speed > 0) {
    animation_delay++;
}