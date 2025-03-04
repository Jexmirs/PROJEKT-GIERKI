h_speed = 0;
v_speed = 0;
walkSpeed = 2;
acceleration = 0.5;
deceleration = 0.2;

weapon_type = "none";
current_weapon = "none";
fire_rate = 15;
fire_timer = 0;
is_throwing = false;
ammo_rifle =  30;
ammo_pistol = 10;
ammo_shotgun = 5;

has_melee = false;
has_grenade = false;
has_shotgun = true;
has_rifle = true; 

masks = ["adrenalina", "morfina", "cos"];
current_mask = 0;
mask = 0;

show_debug_message("Create Event - current_weapon: " + string(current_weapon));
