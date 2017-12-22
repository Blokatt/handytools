frame_start_time = get_timer();

draw_set_colour( c_white );

//Assign all instances a "click index" for click detection rendering
global.click_array = undefined;
global.click_array[ instance_count-1 ] = noone;
global.click_array[ 0                ] = noone;
global.click_index = 1;
with( all ) {
	my_click_index = global.click_index++;
	global.click_array[ my_click_index ] = id;
}

//Set up uniforms for the lighting shader
s_shader_begin( shd_per_texel_lighting );
s_shader_uniform_f( "u_vForceColour", 1.0, 1.0, 1.0, 0.0 );
if ( global.do_lighting ) s_shader_uniform_f( "u_vAmbientColour", 0.1, 0.1, 0.13, 0.0 );
		             else s_shader_uniform_f( "u_vAmbientColour", 1.0, 1.0, 1.00, 1.0 );
		
var _light = 0;
with( obj_camera ) s_shader_set_light( _light++, x, y, z, 100, c_gray, 1 );
with( obj_light ) if ( visible ) s_shader_set_light( _light++, x, y, z, range, colour, 1 );
for( var _i = _light; _i < 8; _i++ ) s_shader_set_light( _light, 0, 0, 0, 1, c_black, 0 );
s_shader_end();