lifetime--;

if (lifetime <= 0) {
    speed *= 0.9;
    if (speed < 0.2) {
        speed = 0;
    }
}
