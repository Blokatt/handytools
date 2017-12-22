persistent = true;

application_surface_draw_enable( false );
surface_resize( application_surface, global.app_surf_w, global.app_surf_h );
display_set_gui_size( DEFAULT_WINDOW_WIDTH, DEFAULT_WINDOW_HEIGHT );

smoothed_timer = 5000;
frame_start_time = get_timer();

global.dither_sprite = dither_make_sprite();
global.dither_texture = sprite_get_texture( global.dither_sprite, 0 );

global.click_array = undefined;
global.click_array[ instance_count-1 ] = noone;
global.click_instance_over  = noone;
global.click_through_mirror = false;

grip_create( "pov"          , global.app_surf_w, global.app_surf_h, false, true  ); grip_activate( "pov" );
grip_create( "click"        , global.app_surf_w, global.app_surf_h, false, true  ); grip_activate( "click" );
grip_create( "2d"           , global.app_surf_w, global.app_surf_h, false, false );
grip_create( "mirror click0", 960, 720, false, true ); grip_activate( "mirror click0" );
grip_create( "mirror click1", 960, 720, false, true ); grip_activate( "mirror click1" );
grip_create( "mirror0"      , 960, 720, false, true ); grip_activate( "mirror0"       );
grip_create( "mirror1"      , 960, 720, false, true ); grip_activate( "mirror1"       );
grip_create( "mirror2"      , 960, 720, false, true ); grip_activate( "mirror2"       );
grip_create( "mirror3"      , 960, 720, false, true ); grip_activate( "mirror3"       );