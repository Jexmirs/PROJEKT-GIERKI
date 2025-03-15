
var  grabCamera_X = camera_get_view_x(view_camera[0]);
var  grabCamera_Y = camera_get_view_y(view_camera[0]);

var grabCamera_Width  = camera_get_view_width(view_camera[0])/2;
var grabCamera_Height = camera_get_view_height(view_camera[0])/2;



var distance = 40;
var left =  instance_create_layer(grabCamera_X+grabCamera_Width-distance+500, grabCamera_Y+grabCamera_Height, "Instances_OnTop", obj_buildings_chapters_3);
    left.direction = 180;
	left.speed = 2;
	
	alarm_set(0, reset_Time);