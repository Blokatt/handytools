///unload_current_room()

trace( "unload" );

with ( obj_subtitle ) {
    alpha_animate = true;
    alpha_direction = -1;
}

with( obj_par_game ) instance_destroy();

global.game_text          = "";
global.game_phone_do_ring = false;
global.game_flower_index  = undefined;
global.game_got_hammer    = false;
global.game_got_scissors  = false;

global.game_outro_do = false;
global.game_outro_last_event = current_time;
global.game_outro_stage = 0;