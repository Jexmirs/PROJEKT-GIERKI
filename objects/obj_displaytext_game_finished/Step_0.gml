if ( time < duration) { 
	
	blink = ease_in_and_out(time, start, dest - start, duration);
	time++;
	}
else { 
	
	var tempStart = start;
	start = dest;
	dest = tempStart;
	time = 0;
	}
	
	

if ( time2 < duration2) { 
	
	wiggle = ease_in_and_out(time2, start2, dest2 - start2, duration2);
	time2++;
	}
else { 
	
	var tempStart2 = start2;
	start2 = dest2;
	dest2 = tempStart2;
	time2 = 0;
	}
	

if(delay > 5115) {
	room_goto(MainMenu);	
}