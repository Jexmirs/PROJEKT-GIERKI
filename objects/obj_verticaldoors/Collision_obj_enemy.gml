if (canTouchThis == true) {
	canTouchThis = false;
	
	
var doorYY = y + lengthdir_y(12, image_angle);	
	
 var normalisedAngle = image_angle;	
	 while( normalisedAngle < 0) { normalisedAngle += 360; }
	
	
	if (other.y > doorYY ){
	  if ( normalisedAngle >= 0 and normalisedAngle <= 90)    { doorSpeed   =  doorSpeedStart;   } 
	  if (normalisedAngle > 90  and normalisedAngle <=  180)  { doorSpeed   = -doorSpeedStart;   } 	
		audio_play_sound(DoorOpen, 1, false);
	  if (normalisedAngle > 180  and normalisedAngle <=  270) { doorSpeed = -doorSpeedStart;  }			
	  if (normalisedAngle > 270  and normalisedAngle <   360) { doorSpeed =  doorSpeedStart;  }
	}
	
	
	    if (other.y < doorYY ) { 			
			if (normalisedAngle >= 0  and normalisedAngle <=   90)  { doorSpeed =  -doorSpeedStart; }
			if (normalisedAngle > 90  and normalisedAngle <=  180)  { doorSpeed =   doorSpeedStart; }	
				audio_play_sound(DoorOpen, 1, false);
			if (normalisedAngle > 180  and normalisedAngle <=  270) { doorSpeed =  doorSpeedStart;  }			
			if (normalisedAngle > 270  and normalisedAngle <   360) { doorSpeed = -doorSpeedStart;  }
			}
		}
