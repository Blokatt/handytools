switch( global.gameflow_mode ) {
	case e_game_mode.local_: var _text = "PLAYER TWO"; break;
	case e_game_mode.ai: var _text = "WOPR"; break;
	case e_game_mode.single:
		if ( global.gameflow_second_player ) {
			var _text = string_upper( options_get( "player name", "PLAYER" ) );
		} else {
			var _text = "GLADOS";
		}
	break;
}

draw_set_halign( fa_center );
draw_set_halign( fa_middle );

draw_set_font( fnt_atari_30 );
draw_text_transformed_shadow_big( x, y, _text, 10,
                                  PLAYER_B_COLOUR_LIGHT, PLAYER_B_COLOUR_DARK );
draw_set_font( fnt_atari_50 );
draw_text_transformed_shadow_big( x, y+40, string_zero_padded( global.gameflow_score_b, 5 ), 10,
                                  PLAYER_B_COLOUR_LIGHT, PLAYER_B_COLOUR_DARK );

draw_set_halign( fa_left );
draw_set_halign( fa_top );