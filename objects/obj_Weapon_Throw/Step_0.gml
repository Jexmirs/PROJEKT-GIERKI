var player = instance_nearest(x, y, obj_Player);

if (place_meeting(x, y, obj_Wall)) {
    speed = 0;
    hspeed = 0;
    vspeed = 0; 
}

image_angle += spin;

if (place_meeting(x, y, obj_Wall)) {
    speed = 0;
    hspeed = 0;
    vspeed = 0; 
}

image_angle += spin;

if (speed < 0.01) {
	var pickup = instance_create_layer(x,y, "Instances", obj_Pickup)
	pickup.sprite_index = sprite_index;
	instance_destroy();
	
}

player.current_weapon = "none";

switch(player.current_weapon) {
    case "none":
        player.sprite_index = sprPWalkUnarmed2;
        break;
}