enum EnemyType {
    DOG,
    HEAVY,
    STANDARD
}


enum AIState {
    IDLE,
    ROAMING,
    CHASING,
    SEARCHING
}

state = AIState.IDLE;


speed_normal = 1.5;
speed_chase = 3.5;
speed_dog = 2.5;
speed_heavy = 1.2;

search_time = 120;
search_timer = 0;
move_delay = 0;
move_delay_range = irandom_range(30, 60);

enemy_type = EnemyType.STANDARD;

if (!variable_global_exists("grid")) {
    global.grid = mp_grid_create(0, 0, room_width div 32, room_height div 32, 32, 32);
    mp_grid_add_instances(global.grid, obj_Wall, false);
}

switch (enemy_type) {
    case EnemyType.DOG:
        vision_range = 300;
        speed_current = speed_dog;
        break;
    case EnemyType.HEAVY:
        vision_range = 150;
        speed_current = speed_heavy;
        break;
    default:
        vision_range = 900;
        speed_current = speed_normal;
        break;
}

if (!variable_global_exists("chasing_team")) {
    global.chasing_team = [];
}

path = path_add();

global.roam_attempts = 0;
global.max_roam_attempts = 10;