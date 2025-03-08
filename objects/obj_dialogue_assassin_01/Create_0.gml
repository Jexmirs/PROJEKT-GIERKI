szerokosc = display_get_gui_width();
wysokosc = display_get_gui_height();
pasek_wysokosc = 150;
font_size = 30;
text_color = c_white;
skip_text = "Press 'Space' to skip";

portrait_width = 150;
portrait_height = 150;


portrait_image = sprAssassinFace;

swing_amplitude = 5;
swing_speed = 0.05;  
swing_offset = 0;    

dialog_text_x = 50;
dialog_text_y = wysokosc - pasek_wysokosc + 20;
skip_text_x = 50;
skip_text_y = 20;

global.time = 0;


global.dialogues = [
    "Question number one:",
    "Do you like hurting other people?",
];

global.dialogue_index = 0;

global.can_skip = false;


global.text_timer = 0;
global.text_speed = 1; 

global.dialog_text = "";
global.full_dialog_text = global.dialogues[global.dialogue_index];
