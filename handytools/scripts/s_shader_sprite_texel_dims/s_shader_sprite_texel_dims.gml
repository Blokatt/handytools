///@param uniform
///@param sprite
///@param image

var _texture = sprite_get_texture( argument1, argument2 );
shader_set_uniform_f( shader_get_uniform( global.shader_focus, argument0 ), texture_get_texel_width( _texture ), texture_get_texel_height( _texture ) );