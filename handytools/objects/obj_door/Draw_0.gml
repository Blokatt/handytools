mouse_active_force_colour();
camera_click_handle_fog();

if ( intro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_per_texel_lighting, "u_fVibrate" ), lerp( 500, 1, intro_t ) );
    shader_set_uniform_f( shader_get_uniform( shd_per_texel_lighting, "u_fGarbage" ), random( 1 ) );
}

matrix_chain_begin();
matrix_chain_rotate_x( -90 );
matrix_chain_rotate_z( image_angle );
matrix_chain_translate( x, y, z+global.game_swell );
matrix_chain_end( matrix_world );
vertex_submit( global.vbf_door, pr_trianglelist, sprite_get_texture( spr_tex_door, 0 ) );
matrix_reset_world();

mouse_active_reset_colour();

if ( intro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_per_texel_lighting, "u_fVibrate" ), 0.0 );
    shader_set_uniform_f( shader_get_uniform( shd_per_texel_lighting, "u_fGarbage" ), 0.0 );
}