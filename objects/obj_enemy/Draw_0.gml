if (can_see_player) {
    draw_sprite_ext(sprLegs, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    image_speed = 1; // Normal animation speed when the player is seen
} else {
    image_speed = 0; // Stop animation when the player is not seen
}


 draw_self();