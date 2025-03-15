if (audio_is_playing(global.snd_MainTrack)) {
    var position = audio_sound_get_track_position(global.snd_MainTrack);
    
    global.last_music_position = position;
} else {
    global.snd_MainTrack = audio_play_sound(MussikperAutomatikk, 1, true);
    audio_sound_set_track_position(global.snd_MainTrack, global.last_music_position);
}

alarm[0] = 1;
