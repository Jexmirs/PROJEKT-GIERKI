image_angle = point_direction(x, y, mouse_x, mouse_y);

var left  = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up    = keyboard_check(ord("W"));
var down  = keyboard_check(ord("S"));

var horizontalSpeed = right - left;
var verticalSpeed   = down - up;

var result_h = horizontalSpeed * (walkSpeed + 1);
var result_v = verticalSpeed * (walkSpeed + 1);

if (!place_meeting(x + result_h, y, obj_Wall)) {
    x += horizontalSpeed * walkSpeed;
}

if (!place_meeting(x, y + result_v, obj_Wall)) {
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
    image_speed = 1;
} else {
    image_speed = 0;
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
        show_debug_message("Brak broni - nie można strzelać.");
        return;
    }
    
    var bullet;
    
    switch (current_weapon) {
        case "pistol":
            if (ammo_pistol > 0) {
                ammo_pistol--;
                show_debug_message("Strzał z pistoletu! Pozostała amunicja: " + string(ammo_pistol));
                bullet = instance_create_layer(x, y, "Instances", obj_bullet);
                bullet.direction = point_direction(x, y, mouse_x, mouse_y);
                bullet.image_angle = bullet.direction;
                bullet.speed = 10;
                fire_rate = 15;
            }
            break;

        case "shotgun":
            if (ammo_shotgun > 0) {
                ammo_shotgun--;
                show_debug_message("Strzał ze strzelby! Pozostała amunicja: " + string(ammo_shotgun));
                for (var i = -10; i <= 10; i += 5) {
                    bullet = instance_create_layer(x, y, "Instances", obj_bullet);
                    bullet.direction = point_direction(x, y, mouse_x, mouse_y) + i;
                    bullet.image_angle = bullet.direction;
                    bullet.speed = 8;
                }
                fire_rate = 30;
            }
            break;

        case "rifle":
            if (ammo_rifle > 0) {
                ammo_rifle--;
                show_debug_message("Strzał z karabinu! Pozostała amunicja: " + string(ammo_rifle));
                bullet = instance_create_layer(x, y, "Instances", obj_bullet);
                bullet.direction = point_direction(x, y, mouse_x, mouse_y);
                bullet.image_angle = bullet.direction;
                bullet.speed = 12;
                fire_rate = 5;
				audio_play_sound(Uzi, 1, false);
            }
            break;
    }

}


if(mouse_check_button_released(mb_right)){
	if(current_weapon != "none") {
	var throwWeapon = instance_create_layer(x,y, "Instances", obj_Weapon_Throw);
	throwWeapon.direction = point_direction(x, y, mouse_x, mouse_y);
	throwWeapon.speed = random_range(7, 10);
	
	switch(current_weapon) {
		case "rifle":
		throwWeapon.sprite_index = spr_uzi
		break;
		case "bat":
		throwWeapon.sprite_index = sprBat
		break;

		}
	}
}

if (mouse_check_button_pressed(mb_right) && sprite_index != sprPAttackPunch && current_weapon = "none") {
    sprite_index = sprPAttackPunch;
    image_index = 0;
    image_speed = 1;
    
    var punch = instance_create_layer(x + lengthdir_x(20, image_angle), y + lengthdir_y(20, image_angle), "Instances", obj_Punch);
    punch.direction = image_angle;
    punch.image_angle = punch.direction;
    punch.owner = id;
    
}

with (obj_Punch) {
    if (owner.sprite_index != sprPAttackPunch) {
        instance_destroy();
    }
}

function melee_attack() {
    if (sprite_index != sprPAttackBat) {
        sprite_index = sprPAttackBat;
        image_index = 0;
        image_speed = 1;
        
        var swing = instance_create_layer(obj_Player.x , obj_Player.y, "Instances", obj_Punch);
        punch.direction = image_angle;
        punch.image_angle = punch.direction;
        punch.owner = id;
        if (obj_Player.sprite_index == sprPWalkUnarmed2) {
            obj_Player.sprite_index = sprPWalkBat;
        }
    }
}

function melee_weapon_attack() {
    if (current_weapon == "bat") {
        sprite_index = sprPAttackBat;
        image_index = 0;
        image_speed = 1;
        
        var swing = instance_create_layer(obj_Player.x , obj_Player.y, "Instances", obj_Punch);
        swing.direction = image_angle;
        swing.image_angle = swing.direction;
        swing.owner = id;
        if (obj_Player.sprite_index == sprPWalkUnarmed2) {
            obj_Player.sprite_index = sprPWalkBat;
        }
    }
}

if (mouse_check_button_pressed(mb_left)) {
    if (current_weapon == "bat") {
        sprite_index = sprPAttackBat;
        image_index = 0;
        image_speed = 1;
        
        var swing = instance_create_layer(obj_Player.x , obj_Player.y, "Instances", obj_Punch);
        swing.direction = image_angle;
        swing.image_angle = swing.direction;
        swing.owner = id;
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

if(sprite_index == sprPWalkUnarmed2 && current_weapon = "bat") {
	obj_Player.sprite_index = sprPWalkBat	
}

with (obj_Punch) {
    if (owner.sprite_index != sprPAttackPunch && owner.sprite_index != sprPAttackBat) {
        instance_destroy();
    }
}