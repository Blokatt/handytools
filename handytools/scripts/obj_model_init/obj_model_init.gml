if ( OBJ_MODEL_ON ) {
	trace( "OBJ MODEL" );
	
	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_texcoord();
	vertex_format_add_colour();
	vertex_format_add_normal();
	global.vft_simple_3d = vertex_format_end();

	vertex_format_begin();
	vertex_format_add_position();
	vertex_format_add_texcoord();
	vertex_format_add_colour();
	global.vft_simple_2d = vertex_format_end();

	global.obj_map               = tr_map_create( "<.obj map>"     , true );
	global.obj_load_map          = tr_map_create( "<.obj load map>", true );
	global.obj_vertex_buffer_map = tr_map_create( "<.obj name map>", true );
}