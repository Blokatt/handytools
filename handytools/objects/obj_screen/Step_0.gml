if ( surface_exists( srf_click ) ) {
    var _pixel = surface_getpixel( srf_click, global.app_surf_w*0.5, global.app_surf_h*0.5 );
    var _blue  = ( _pixel >> 16 ) & 255;
    var _green = ( _pixel >>  8 ) & 255;
    var _red   =   _pixel         & 255;
    var _index = _red + _green*256;
    click_instance_over = click_array[_index];
    click_through_mirror = ( _blue > 0 );
}

srf_pov = tr_surface_check( srf_pov, global.app_surf_w, global.app_surf_h );
srf_click = tr_surface_check( srf_click, global.app_surf_w, global.app_surf_h );

with( obj_camera ) {
	var _view_matrix = matrix_build_lookat( x, y, z,   look_x, look_y, look_z,   0, 0, 1 );
	var _proj_matrix = matrix_flip_y( matrix_build_projection_perspective_fov( FOV, surface_get_aspect( other.srf_pov ), 1, 4000 ) );
	camera_set_view_mat( other.camera_pov, _view_matrix );
	camera_set_proj_mat( other.camera_pov, _proj_matrix );
	camera_set_view_mat( other.camera_click, _view_matrix );
	camera_set_proj_mat( other.camera_click, _proj_matrix );
}

view_create_camera_surface( 0, camera_pov, srf_pov );
view_create_camera_surface( 1, camera_click, srf_click );