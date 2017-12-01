event_inherited();

if ( mouse_clicked ) and ( !in_tween ) and ( !out_tween ) {
	async = get_string_async( "What's your name?", options_get( "player name", "dingus" ) );
}

if ( in_tween ) {
	in_tween_t = clamp( ( current_time - in_tween_start_time ) / in_tween_length, 0, 1 );
	y = lerp( ystart - room_height, ystart, dsin( in_tween_t * 90 ) );
	if ( in_tween_t >= 1 ) in_tween = false;
	script_execute( fit_function, 130 );
}

if ( out_tween ) {
	out_tween_t = clamp( ( current_time - out_tween_start_time ) / out_tween_length, 0, 1 );
	y = lerp( ystart - room_height, ystart, dsin( 90 + out_tween_t * 90 ) );
	if ( out_tween_t >= 1 ) out_tween = false;
	script_execute( fit_function, 130 );
}