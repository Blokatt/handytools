//  April 2017
//  Juju Adams
//  julian.adams@email.com
//  @jujuadams
//
//  This code and engine are provided under the Creative Commons "Attribution - NonCommerical - ShareAlike" international license.
//  https://creativecommons.org/licenses/by-nc-sa/4.0/

draw_set_colour( c_white );
draw_set_font( fnt_consolas );

switch( test_mode ) {
    case 0:
        draw_text( 5, 5, "SCRIBBLE" );
		var _t = get_timer();
        scribble_draw( 15, 40, lorem_ipsum_json, dsin_norm( current_time/70 ), 50 );
		_t = get_timer() - _t;
    break;
    case 1:
        draw_text( 5, 5, "NATIVE" );
		var _t = get_timer();
        draw_text_ext( 15, 40, lorem_ipsum_string, 20, 800 );
		_t = get_timer() - _t;
    break;
	/*
    case 1:
        draw_text( 5, 5, "SCROLLBOX" );
        text_scrollbox_draw( scrollbox_x, scrollbox_y, scrollbox, scrollbox_focus_text );
    break;
	*/
}

render_time_smoothed = lerp( render_time_smoothed, _t, 0.1 );
draw_text( 100, 5, concat( "Render time=", render_time_smoothed ) );