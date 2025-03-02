text = "+" + string(400) + "PTS"; // text to be displayed

global.score = 0;
// move up and rotate
moveY = 0.1;

// set -> rotation
angle = 0;
angle_Add = 3;
angle_Length = 0.6;



// color shifiting! -> static, hue is only changing
textColor_Front_Sat = 100;
textColor_Front_Lum = 240;

textColor_Shadow_Sat = 100;
textColor_Shadow_Lum = 54;



textColor_Hue_Add   = -0.5; // color shift through hue value
textColor_Hue_Start = 336;
textColor_Hue_End   = 190;
 textColor_Hue = textColor_Hue_Start



// state machine
state = "pop in";

text_Size = 0;
text_Size_Add = 0.05;

text_Size_Max = 0.5;


#region not used -> wobble

textColor_Front  = #D9C9E6;
textColor_Shadow = #915CA0;

_channel = animcurve_get_channel( anicurve_Wobble, 0 );
_channel_Timer = 0;
_channel_Time = 60;




#endregion