var text = "Menue" + " \n" + " Setting" + " \n" + " quit ";
var scale = 5;

var text_1 = "start game";
var text_2 = "continue";
var text_3 = "opitons";
var text_4 = "quit";



draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_1, text_1, 200,200, scale, scale, wiggle, color3,color3,color3,color3, 1 );
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_1, text_1, 200,200, scale, scale, wiggle, color2,color2,color2,color2, 1 );
draw_text_ext_transformed_color(grabCamera_Width-2, grabCamera_Height+ posY_1-2, text_1, 200,100, scale, scale, wiggle, color,color,color,color, blink );


draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_2, text_2, 100,100, scale, scale, wiggle, color3,color3,color3,color3, 1 );
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_2, text_2, 100,100, scale, scale, wiggle, color2,color2,color2,color2, 1 );
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_2, text_2, 100,100, scale, scale, wiggle, color,color,color,color, blink );

draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_3, text_3, 100,100, scale, scale, wiggle, color3,color3,color3,color3, 1 );
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_3, text_3, 100,100, scale, scale, wiggle, color2,color2,color2,color2, 1 );
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_3, text_3, 100,100, scale, scale, wiggle, color,color,color,color, blink ); 

draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_4, text_4, 100,100, scale, scale, wiggle, color3,color3,color3,color3, 1 );
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_4, text_4, 100,100, scale, scale, wiggle, color2,color2,color2,color2, 1 );
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_4, text_4, 100,100, scale, scale, wiggle, color,color,color,color, blink );



var posY_Selected = 1;
var text_Selected = text_1;

switch(selected){ 
	case 1:
	posY_Selected = posY_1;
    text_Selected = text_1; break;

	case 2:
	posY_Selected = posY_2;
    text_Selected = text_2; break;

	case 3:
	posY_Selected = posY_3;
    text_Selected = text_3; break;

	case 4:
	posY_Selected = posY_4;
    text_Selected = text_4; break;

	}


for (var i = 0; i < draw_Extra; i++ ) {
draw_text_ext_transformed_color(grabCamera_Width+i  , grabCamera_Height+ posY_Selected,    text_Selected, 200,200, scale, scale, wiggle, color3,color3,color3,color3, 1 );
draw_text_ext_transformed_color(grabCamera_Width+i  , grabCamera_Height+ posY_Selected,    text_Selected, 200,200, scale, scale, wiggle, color4,color4,color4,color4, 1 );
draw_text_ext_transformed_color(grabCamera_Width-2+i, grabCamera_Height+ posY_Selected-2,  text_Selected, 200,100, scale, scale, wiggle, color,color,color,color, blink );

}