var text = "Menue" + " \n" + " Setting" + " \n" + " quit ";
var scale = 6;

var text_1 = "Four Cities Masacre";

var posY_Selected = 1;
var text_Selected = text_1;

for (var i = 0; i < draw_Extra; i++ ) {
draw_text_ext_transformed_color(grabCamera_Width+i  , grabCamera_Height+ posY_Selected + i,    text_Selected, 200,200, scale, scale, wiggle, color3,color3,color3,color3, 0.5);
draw_text_ext_transformed_color(grabCamera_Width+i  , grabCamera_Height+ posY_Selected + i,    text_Selected, 200,200, scale, scale, wiggle, color4,color4,color4,color4, 1);
}