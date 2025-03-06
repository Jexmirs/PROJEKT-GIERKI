if(current_weapon = "bat") {
if (place_meeting(x, y, obj_Player)) {
	delay++;
    obj_enemy.sprite_index = sprEAttackBat;
	image_speed = 0.5;
	
	    if(delay > 120) {
		var offset = 20;
        var swing_x = x + lengthdir_x(offset, image_angle);
        var swing_y = y + lengthdir_y(offset, image_angle);

        var swing = instance_create_layer(swing_x, swing_y, "Instances", obj_Swing_Enemy);
        swing.direction = image_angle;
        swing.image_angle = swing.direction;
        swing.owner = id;
		audio_play_sound(Swing1, 1, false);
		instance_destroy(obj_Player);
		instance_destroy(obj_Camera);
		delay = 0;
		}
	}
}