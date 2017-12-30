if ( !window_get_fullscreen() ) {
    display_set_gui_size( display_get_width(), display_get_height() );
    surface_resize( APP_SURF, display_get_width(), display_get_height() );
} else {
    window_set_rectangle( options_get( "window x"      ),
                          options_get( "window y"      ),
                          options_get( "window width"  ),
                          options_get( "window height" ) );              
    display_set_gui_size( options_get( "window width"  ), options_get( "window height" ) );
    surface_resize( APP_SURF, options_get( "window width"  ), options_get( "window height" ) );
}

alarm[2] = 20;
phase = 2;