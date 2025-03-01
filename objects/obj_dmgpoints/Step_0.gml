
// move up and rotate
angle += angle_Add;
y -= moveY;



// color shift
textColor_Hue += textColor_Hue_Add;

textColor_Front  = make_color_hsv(textColor_Hue,   textColor_Front_Sat , textColor_Front_Lum   );
textColor_Shadow = make_color_hsv(textColor_Hue,   textColor_Shadow_Sat, textColor_Shadow_Lum  );



// state machine
if ( state == "pop in"){
text_Size += text_Size_Add;
 if(text_Size >= text_Size_Max ){ state = "idle";  }
}

if ( state == "idle"){
    if ( textColor_Hue <= (textColor_Hue_End - 15)){  state = "pop out"; }
	}  	

if ( state == "pop out"){
	text_Size -= text_Size_Add;
	 if( text_Size <= 0){  instance_destroy(); }
}
	
	
	
#region not used -> wobble

/*
_channel_Timer += 1/_channel_Time;
if(_channel_Timer >= 1){ _channel_Timer = 0; }


var _val = animcurve_channel_evaluate(_channel, _channel_Timer); 
//    shadow_Angle = _val;

text_Size = text_Size_Max - ( _val * 0.01 );
*/

#endregion	
	


