if (other.weapon_type == 0) {
    other.weapon_type = 2; // Equip gun
    other.weapon = self;  // Assign the gun as the player's current weapon
    instance_destroy(); // Destroy the pickup item
}