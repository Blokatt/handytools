if ( FPS_ON ) frame_start_time = get_timer();

s_shader_end();
draw_set_colour( c_white );
draw_set_alpha( 1 );

if ( SCREEN_3D ) {
    
    //Assign all instances a "click index" for click detection rendering
    global.click_array = undefined;
    global.click_array[ instance_count-1 ] = noone;
    global.click_array[ 0                ] = noone;
    global.click_index = 1;
    with( all ) {
        my_click_index = global.click_index++;
        global.click_array[ my_click_index ] = id;
    }
    
    s_shader_begin( SCREEN_3D_SHADER );
    s_shader_float( "u_fZFar", DEFAULT_Z_FAR );
    screen_set_shader_lights( light_priority, 1 );
    s_shader_rgba( "u_vForceColour", c_white, 0 );
    s_shader_end();
    
} else {
    
    //2D stuff idk
    
}

//Render out manual grips
grip_handle_predraw();