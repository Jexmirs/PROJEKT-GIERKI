if (place_meeting(x, y, obj_Wall)) {
    speed = 0;
    hspeed = 0;
    vspeed = 0; 
}

image_angle += spin;

if (speed < 0.01) {
    instance_create_layer(x, y, "Instances_1", obj_Pickup);
    instance_destroy();    
}
