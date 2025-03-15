audio_stop_all();

global.snd_MainTrack = audio_play_sound(Acid_Spit, 1, true);
audio_sound_set_track_position(global.snd_MainTrack, global.last_music_position);