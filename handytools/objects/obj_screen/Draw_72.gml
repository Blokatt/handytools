if ( SCREEN_3D ) screen_3d_start();
if ( SCREEN_BACKGROUND_COLOUR != undefined ) draw_clear( SCREEN_BACKGROUND_COLOUR );

switch( grip_get_current() ) {
    
    case "3d": //What the player sees, using forward rendering for lights
        
        //This fixes a bug with GM automatically submitting a blank vertex buffer to a shader in the wrong format
        if ( instance_exists( obj_par_3d ) ) s_shader_begin( SCREEN_3D_SHADER );
    break;
    
    case "click": //A screenspace click detection render
        global.screen_click_render = true;
    break;
    
    case "mirror0": //Render out mirrors
    case "mirror1":
    case "mirror2":
    case "mirror3":
        global.screen_mirror_render = true;
        s_shader_begin( SCREEN_3D_SHADER );
    break;
    
    case "mirror click0": //Render out mirror click detection
    case "mirror click1":
        global.screen_click_render = true;
        global.screen_mirror_render = true;
    break;
    
}