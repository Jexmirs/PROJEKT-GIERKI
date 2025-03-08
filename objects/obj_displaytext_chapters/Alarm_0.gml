var reset_Time = animateTime;

if (Increase) { 
    draw_Extra++;
    
    if (draw_Extra > draw_ExtraMax) { 
        current_Letter++;
        draw_Extra = 0;
        
        if (current_Letter >= string_length("Fun & Gamess")) {
            current_Letter = 0;
            reset_Time = 60
        }
        
        Increase = false;
    }
} else { 
    draw_Extra--;
    
    if (draw_Extra < 0) { 
        Increase = true;
    }
}

alarm_set(0, reset_Time);
