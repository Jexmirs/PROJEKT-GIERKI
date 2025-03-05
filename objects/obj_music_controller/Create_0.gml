// Create Event of obj_music_controller

// Play the music sound from position 0 and store the handle
if (!variable_global_exists("last_music_position")) {
    global.last_music_position = 0; // Start from 0 if no position is stored
}

global.snd_MainTrack = audio_play_sound(Musikkperautomatikk, 1, true); // true for looping the music
audio_sound_set_track_position(global.snd_MainTrack, global.last_music_position); // Set the starting position

// Set alarm to check position every 60 steps (1 second)
alarm[0] = 60;
