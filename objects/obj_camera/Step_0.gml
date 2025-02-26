var grabCamera_Width = camera_get_view_width(view_camera[0]);
var grabCamera_Height = camera_get_view_height(view_camera[0]);
var grabCamera_X = camera_get_view_x(view_camera[0]);
var grabCamera_Y = camera_get_view_y(view_camera[0]);

// Debugowanie pozycji kamery
show_debug_message("Camera Position X: " + string(grabCamera_X) + " Y: " + string(grabCamera_Y));

if (instance_exists(target)) {
    var cameraX = clamp(target.x - grabCamera_Width / 2, 0, room_width - grabCamera_Width);
    var cameraY = clamp(target.y - grabCamera_Height / 2, 0, room_height - grabCamera_Height);

    // Debugowanie pozycji docelowej
    show_debug_message("Target Position X: " + string(target.x) + " Y: " + string(target.y));
    show_debug_message("Calculated Camera X: " + string(cameraX) + " Y: " + string(cameraY));

    var smooth = 0.1;
    camera_set_view_pos(view_camera[0],
                        lerp(grabCamera_X, cameraX, smooth),
                        lerp(grabCamera_Y, cameraY, smooth));
} else {
    show_debug_message("Target does not exist!");
}
