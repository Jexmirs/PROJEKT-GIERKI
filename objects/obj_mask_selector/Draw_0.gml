// obj_mask_selector - Draw Event

// Tło z ręcznie rysowanym gradientem w stylu retro lat 80-tych (Hotline Miami)
var grad_width = 100; // Zwiększenie szerokości paska z gradientem
var grad_height = room_height; // Wysokość tła

// Rysowanie gradientu (pomarańcz, czerwony, różowy)
for (var i = 0; i < grad_height; i++) {
    // Obliczanie koloru na podstawie pozycji Y (gradient przechodzący przez pomarańcz, czerwony, różowy)
    var grad_color = make_color_hsv(lerp(15, 345, i / grad_height), 255, lerp(180, 255, i / grad_height)); // Przechodzenie przez pomarańcz, czerwony i różowy
    draw_set_color(grad_color);
    draw_rectangle(grad_width, i, grad_width + 100, i + 1, false); // Rysowanie paska gradientowego
}

// Dodanie konturu do gradientu (w stylu retro)
draw_set_color(make_color_rgb(255, 150, 0)); // Kolor konturu (jasnopomarańczowy)
draw_rectangle(grad_width - 3, 0, grad_width + 103, grad_height, false); // Kontur wokół paska gradientowego

// Obliczanie pozycji, gdzie maska powinna się pojawić (na środku gradientu)
var mask_sprite = mask_icons[current_mask];
var mask_width = sprite_get_width(mask_sprite); // Szerokość sprite
var mask_height = sprite_get_height(mask_sprite); // Wysokość sprite

// Obliczanie pozycji, gdzie maska powinna się pojawić (na środku gradientu)
var center_x = grad_width / 2 - mask_width / 2; // Wyśrodkowanie w poziomie względem gradientu
var center_y = room_height / 2 - mask_height / 2; // Wyśrodkowanie w pionie względem gradientu

// Rysowanie aktualnej maski (bez animacji)
draw_sprite(mask_sprite, 0, grad_width + center_x, center_y); // Rysowanie maski na środku

// Rysowanie opisu maski obok paska (bez animacji)
var description_offset = grad_width + 120; // Odstęp od prawej krawędzi paska gradientowego

// Wyświetlanie opisu maski na środku gradientu
draw_set_color(c_white);
draw_text(description_offset, room_height / 2 - 50, "Mask: " + masks[current_mask]); // Nazwa maski
draw_set_color(make_color_rgb(200, 200, 200)); // Jasnoszary kolor
draw_text(description_offset, room_height / 2, mask_descriptions[current_mask]); // Opis maski

// Instrukcje sterowania
draw_set_color(c_white);
draw_text(20, room_height - 50, "Use UP/DOWN arrows to change mask. Press ENTER to select.");
