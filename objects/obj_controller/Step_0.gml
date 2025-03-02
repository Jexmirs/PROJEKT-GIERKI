if (instance_number(obj_enemy) == 0 && !global.floor_cleared) {
    global.show_clear_message = true;
    global.clear_timer = 120; // Czas trwania animacji
    global.floor_cleared = true; // Zapamiętaj, że poziom jest wyczyszczony
}
