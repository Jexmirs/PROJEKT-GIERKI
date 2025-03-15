image_angle = point_direction(x, y, mouse_x, mouse_y);
image_angle_ = direction;

var left  = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up    = keyboard_check(ord("W"));
var down  = keyboard_check(ord("S"));

var horizontalSpeed = right - left;
var verticalSpeed   = down - up;

var result_h = horizontalSpeed * (walkSpeed + 1);
var result_v = verticalSpeed * (walkSpeed + 1);

if (!place_meeting(x + result_h, y, obj_Wall) && !place_meeting(x + result_h, y, obj_car)) {
    x += horizontalSpeed * walkSpeed;
}

if (!place_meeting(x, y + result_v, obj_Wall) && !place_meeting(x, y + result_v, obj_car)) {
    y += verticalSpeed * walkSpeed;
}

if (keyboard_check_pressed(vk_left)) {
    current_mask = (current_mask - 1 + array_length(masks)) mod array_length(masks);
}
if (keyboard_check_pressed(vk_right)) {
    current_mask = (current_mask + 1) mod array_length(masks);
}

switch (masks[current_mask]) {
    case "Tony": break;
    case "Rasmus": break;
    case "Don Juan": break;
}

var camSpeed = 0.1;
var targetX = obj_Player.x - (display_get_width() / 2);
var targetY = obj_Player.y - (display_get_height() / 2);

view_xview[0] = lerp(view_xview[0], targetX, camSpeed);
view_yview[0] = lerp(view_yview[0], targetY, camSpeed);

view_xview[0] = clamp(view_xview[0], 0, room_width - display_get_width());
view_yview[0] = clamp(view_yview[0], 0, room_height - display_get_height());

if (!variable_global_exists("has_melee")) has_melee = false;
if (!variable_global_exists("has_grenade")) has_grenade = false;
if (!variable_global_exists("has_shotgun")) has_shotgun = false;
if (!variable_global_exists("has_rifle")) has_rifle = false;


if (keyboard_check(vk_shift)) {
    if (!instance_exists(obj_TargetDummy)) {  
        targetDummy = instance_create_layer(mouse_x, mouse_y, "Instances", obj_TargetDummy);
        obj_Camera.target = targetDummy;
    }

    var grabCamera_Width  = camera_get_view_width(view_camera[0]);
    var grabCamera_Height = camera_get_view_height(view_camera[0]);

    targetDummy.x = clamp(mouse_x, x - ((grabCamera_Width/2) - 20), x + ((grabCamera_Width/2) - 20));
    targetDummy.y = clamp(mouse_y, y - ((grabCamera_Height/2) - 20), y + ((grabCamera_Height/2) - 20));        

    obj_TargetDummy.timer = 5;
}

if (horizontalSpeed != 0 || verticalSpeed != 0) {
    image_speed = 0.5;
	walk_timer++
} else {
    image_speed = 0;
	walk_timer = 0;
}

if (fire_timer > 0) {
    fire_timer--;
}

show_debug_message("fire_timer: " + string(fire_timer));
show_debug_message("current_weapon: " + string(current_weapon));

if (mouse_check_button(mb_left) && fire_timer == 0 && current_weapon != "none") {
    show_debug_message("Naciśnięto przycisk myszy!");
    
    fire_timer = fire_rate;
    shoot();
}

function shoot() {
    if (current_weapon == "none") {
        return;
    }
    
    var bullet;
    
    switch (current_weapon) {
        case "pistol":
		if (mouse_check_button_pressed(mb_left)) {
            if (ammo_pistol > 0) {
                ammo_pistol--;
                bullet = instance_create_layer(x, y, "Instances", obj_bullet);
                bullet.direction = point_direction(x, y, mouse_x, mouse_y);
                bullet.image_angle_ = bullet.direction;
                bullet.speed = 10;
                fire_rate = 1;
				audio_play_sound(Pistol, 1, false);
            }
		}
            break;

        case "shotgun":
            if (ammo_shotgun > 0) {
                ammo_shotgun--;
                for (var i = -10; i <= 10; i += 5) {
                    bullet = instance_create_layer(x, y, "Instances", obj_bullet);
                    bullet.direction = point_direction(x, y, mouse_x, mouse_y) + i;
                    bullet.image_angle_ = bullet.direction;
                    bullet.speed = 8;
					audio_play_sound(Shotgun, 1, false);
                }
                fire_rate = 30;
            }
            break;

        case "rifle":
            if (ammo_rifle > 0) {
                ammo_rifle--;
                bullet = instance_create_layer(x, y, "Instances", obj_bullet);
                bullet.direction = point_direction(x, y, mouse_x, mouse_y);
                bullet.image_angle_ = bullet.direction;
                bullet.speed = 12;
                fire_rate = 5;
				audio_play_sound(M16, 1, false);
            }
            break;
	
	        case "uzi":
            if (ammo_uzi > 0) {
                ammo_uzi--;
                bullet = instance_create_layer(x, y, "Instances", obj_bullet);
                bullet.direction = point_direction(x, y, mouse_x, mouse_y);
                bullet.image_angle_ = bullet.direction;
                bullet.speed = 15;
                fire_rate = 6;
				audio_play_sound(Uzi, 1, false);
            }
            break;
			
			case "mp5":
            if (ammo_mp5 > 0) {
                ammo_mp5--;
                bullet = instance_create_layer(x, y, "Instances", obj_bullet);
                bullet.direction = point_direction(x, y, mouse_x, mouse_y);
                bullet.image_angle_ = bullet.direction;
                bullet.speed = 14;
                fire_rate = 5;
				audio_play_sound(MP5, 1, false);
            }
            break;
    }

}

if(mouse_check_button_pressed(mb_right)) {
	if(current_weapon != "none") {
	var throwWeapon = instance_create_layer(x,y, "Instances", obj_Weapon_Throw);
	throwWeapon.direction = point_direction(x, y, mouse_x, mouse_y);
	throwWeapon.speed = random_range(7, 10);
	audio_play_sound(Throw, 1, false);
	
	switch(current_weapon) {
		case "rifle":
		throwWeapon.sprite_index = sprM16
		break;
		case "bat":
		throwWeapon.sprite_index = sprBat
		break
		case "shotgun":
		throwWeapon.sprite_index = sprShotgun;
		break;
		case "mp5":
		throwWeapon.sprite_index = sprMP5;
		break;
		case "pistol":
		throwWeapon.sprite_index = sprPistol;
		break;
		case "uzi":
		throwWeapon.sprite_index = sprUzi;
		break;
		case "knife":
		throwWeapon.sprite_index = sprKnife;
		break;
		case "axe":
		throwWeapon.sprite_index = sprAxe;
		break;
		}
	}
}

if (mouse_check_button_pressed(mb_left) && sprite_index != sprPAttackPunch && current_weapon == "none") {
    sprite_index = sprPAttackPunch;
    image_index = 0;
    image_speed = 1;

    var offset = 20;
    var punch_x = x + lengthdir_x(offset, image_angle);
    var punch_y = y + lengthdir_y(offset, image_angle);

    var punch = instance_create_layer(punch_x, punch_y, "Instances", obj_Punch);
    punch.direction = image_angle;
    punch.image_angle = punch.direction;
    punch.owner = id;
    punch.depth = -10;
	audio_play_sound(Swing1, 1, false);
}

with (obj_Swing) {
    if (owner.sprite_index != sprPAttackPunch) {
        instance_destroy();
    }
}

if (sprite_index == sprPAttackPunch || sprite_index == sprPAttackBat || sprite_index == sprPAttackKnife || sprite_index == sprPAttackAxe) {
    if (image_index >= image_number - 1) {
        if (horizontalSpeed != 0 || verticalSpeed != 0) {
            sprite_index = sprPWalkUnarmed2;
        } else {
            sprite_index = sprPWalkUnarmed2;
        }
        image_speed = 0;
    } else {
        image_speed = 1;
    }
}

function melee_attack() {
    if (sprite_index != sprPAttackBat) {
        sprite_index = sprPAttackBat;
        image_index = 0;
        image_speed = 0.5;

		var offset = 20;
        var swing_x = x + lengthdir_x(offset, image_angle);
        var swing_y = y + lengthdir_y(offset, image_angle);

        var swing = instance_create_layer(swing_x, swing_y, "Instances", obj_Swing);
        swing.direction = image_angle;
        swing.image_angle = swing.direction;
        swing.owner = id;
        swing.depth = -20;
		audio_play_sound(Swing1, 1, false);
        if (obj_Player.sprite_index == sprPWalkUnarmed2) {
            obj_Player.sprite_index = sprPWalkBat;
        }
    }
}

function melee_weapon_attack() {
    if (current_weapon == "bat") {
        sprite_index = sprPAttackBat;
        image_index = 0;
        image_speed = 0.5;

		var offset = 20;
        var swing_x = x + lengthdir_x(offset, image_angle);
        var swing_y = y + lengthdir_y(offset, image_angle);

        var swing = instance_create_layer(swing_x, swing_y, "Instances", obj_Swing);
        swing.direction = image_angle;
        swing.image_angle = swing.direction;
        swing.owner = id;
        swing.depth = -20;
		audio_play_sound(Swing1, 1, false);
        if (obj_Player.sprite_index == sprPWalkUnarmed2) {
            obj_Player.sprite_index = sprPWalkBat;
        }
    }

}

if (mouse_check_button_pressed(mb_left)) {
    if (current_weapon == "bat" || current_weapon == "knife" || current_weapon == "axe") {
        switch (current_weapon) {
            case "bat":
                sprite_index = sprPAttackBat;
                break;
            case "knife":
                sprite_index = sprPAttackKnife;
                break;
            case "axe":
                sprite_index = sprPAttackAxe;
                break;
        }
        
        image_index = 0;
        image_speed = 0.3;

        var offset = 20;
        var swing_x = x + lengthdir_x(offset, image_angle);
        var swing_y = y + lengthdir_y(offset, image_angle);

        var swing = instance_create_layer(swing_x, swing_y, "Instances", obj_Swing);
        swing.direction = image_angle;
        swing.image_angle = swing.direction;
        swing.owner = id;
        swing.depth = -20;

        switch (current_weapon) {
            case "bat":
                audio_play_sound(Swing1, 1, false);
                break;
            case "knife":
                audio_play_sound(Swing1, 1, false);
                break;
            case "axe":
                audio_play_sound(Swing1, 1, false);
                break;
        }
    }
}


if (sprite_index == sprPAttackPunch || sprite_index == sprPAttackBat) {
    if (image_index >= image_number - 1) {
        if (horizontalSpeed != 0 || verticalSpeed != 0) {
            sprite_index = sprPWalkUnarmed2;
        } else {
            sprite_index = sprPWalkUnarmed2;
        }
        image_speed = 0;
    } else {
        image_speed = 1;
    }
}

if (sprite_index == sprPWalkUnarmed2 && current_weapon == "bat") {
    obj_Player.sprite_index = sprPWalkBat;
} else if (sprite_index == sprPWalkUnarmed2 && current_weapon == "knife") {
    obj_Player.sprite_index = sprPWalkKnife;
} else if (sprite_index == sprPWalkUnarmed2 && current_weapon == "axe") {
    obj_Player.sprite_index = sprPWalkAxe;
}


with (obj_Punch) {
    if (owner.sprite_index != sprPAttackPunch && owner.sprite_index != sprPAttackBat) {
        instance_destroy();
    }
}

//Eventy związane z dialogami itd.

var distance_to_event = distance_to_object(obj_dialogue_event);

if (instance_exists(obj_dialogue_event)) {
    if (distance_to_event < 5) {
                    
            instance_destroy(obj_dialogue_event);
           
            instance_create_layer(x, y, "Instances", obj_dialogue_assassin_01);
	}

}

//Samochód
var distance_to_car = distance_to_object(obj_car);

if (instance_exists(obj_car)) && global.floor_cleared {
    if (distance_to_car < 5) {
        obj_car.image_speed = 1;
        obj_car.mask_index = sprCarMask;
        
        if (obj_car.image_index >= 2) {
            obj_car.image_speed = 0;
            obj_car.image_index = 2;
        }
    } else {
        obj_car.mask_index = noone;

        if (obj_car.image_index > 0) {
            obj_car.image_speed = -0.5;
        }
		if(image_index = 1) {
            obj_car.image_speed = 0;
            obj_car.image_index = 0;
		}
        }
    }

var distance_to_finished_event = distance_to_object(obj_car_sitting);

if (instance_exists(obj_car_sitting)) && global.floor_cleared {
    if (distance_to_finished_event < 1) { 
		room_goto_next();	
	}
}

var distance_to_stairs = distance_to_object(obj_stairs);

if (instance_exists(obj_stairs)) && global.floor_cleared && (stairs_delay == 0) {
    if (distance_to_stairs < 1) { 
		room_goto(Level1Second);	
	}
}