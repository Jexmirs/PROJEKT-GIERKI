// Add place meeting check for obj_Wall
if (place_meeting(x, y, obj_Wall)) {
    // Stop the object's movement upon collision
    speed = 0;  // Set speed to 0, effectively stopping the object
    // Optionally, you can also set the object's velocity to 0 if you're using velocity-based movement:
    hspeed = 0;  // Horizontal velocity to 0
    vspeed = 0;  // Vertical velocity to 0
}

// Adjust image angle
image_angle += spin;

// Check if speed is below a threshold
if (speed < 0.01) {
    // Create obj_Pickup instance at the current position
    instance_create_layer(x, y, "Instances", obj_Pickup);
    // Destroy the current instance of the object
    instance_destroy();    
}
