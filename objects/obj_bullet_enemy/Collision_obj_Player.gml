instance_create_layer(x, y, "Instances", obj_enemy_dead);
instance_destroy(obj_Player);
instance_destroy(obj_Camera);

instance_destroy();

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
		image_speed = 0;
    }