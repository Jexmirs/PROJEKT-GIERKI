gpu_set_blendmode(bm_subtract);
my_y = random(64);
draw_set_alpha(0.1);
draw_sprite_tiled(sprScanLines, 0, 0, my_y);
gpu_set_blendmode(bm_normal);