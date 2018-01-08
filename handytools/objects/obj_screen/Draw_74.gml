var _surface = grip_get_surface( SCREEN_3D? "3d" : "2d" );
if ( _surface == undefined ) _surface = application_surface;

blur_surface          = tr_surface_check_auto( blur_surface          );
blur_transfer_surface = tr_surface_check_auto( blur_transfer_surface );
surface_blur_to_surface( _surface, blur_transfer_surface, blur_surface, shd_gaussian );

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _app_w = surface_get_width(  _surface );
var _app_h = surface_get_height( _surface );
var _scale_w = _gui_w / _app_w;
var _scale_h = _gui_h / _app_h;
var _scale = min( _scale_w, _scale_h );
if ( ( _scale >= 1 ) && FORCE_WINDOW_SCALE_INTEGER ) _scale = floor( _scale );
var _draw_w = _app_w*_scale;
var _draw_h = _app_h*_scale;
var _draw_x = 0.5*( _gui_w - _draw_w );
var _draw_y = 0.5*( _gui_h - _draw_h );

gpu_set_blendenable( false );
    
if ( SCREEN_3D && DEVELOPMENT && global.screen_show_click ) {
    
    //Debug mode for click surface checking
    draw_surface_stretched( grip_get_surface( "click" ), _draw_x, _draw_y, _draw_w, _draw_h );
    
} else if ( ALLOW_FXAA && global.screen_do_fxaa ) {
    
    s_shader_begin( shd_fxaa );
    s_shader_surface_texel_dims( "u_vTexel", _surface );
    draw_surface_stretched( _surface, _draw_x, _draw_y, _draw_w, _draw_h );
    s_shader_end();
        
} else if ( ALLOW_DITHER && global.screen_do_dither ) {
    
    s_shader_begin( shd_dither );
    s_shader_texture_sampler( "u_sDither", global.dither_texture );
    s_shader_float( "u_vTextureSize", _app_w, _app_h );
    draw_surface_stretched( _surface, _draw_x, _draw_y, _draw_w, _draw_h );
    s_shader_end();
        
} else {
    //*
    s_shader_begin( shd_deferred_lighting );
    s_shader_float( "u_fZFar", DEFAULT_Z_FAR );
    screen_set_shader_lights( light_priority, 1 );
    s_shader_surface_sampler( "u_sDepth", grip_get_depth_surface( "3d" ) );
    s_shader_surface_sampler( "u_sNormal", grip_get_normal_surface( "3d" ) );
    s_shader_matrix( "u_mInverseViewProj", matrix_inverse( matrix_multiply( grip_get_view_matrix( "3d" ), grip_get_proj_matrix( "3d" ) ) ) );
    draw_surface_stretched( _surface, _draw_x, _draw_y, _draw_w, _draw_h );
    s_shader_end();
    /*/
    s_shader_begin( shd_dof );
    s_shader_surface_sampler( "u_sDepth", grip_get_depth_surface( "3d" ) );
    s_shader_surface_sampler( "u_sBlur", blur_surface );
    s_shader_float( "u_vDOF_centre", global.click_depth_smoothed );
    s_shader_float( "u_vDOF_range", lerp( 0.15, 1, global.click_depth_smoothed ) );
    draw_surface_stretched( _surface, _draw_x, _draw_y, _draw_w, _draw_h );
    s_shader_end();
    //*/
}
    
gpu_set_blendenable( true );