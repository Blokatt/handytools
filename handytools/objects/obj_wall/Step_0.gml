if ( global.game_room == 10 ) or ( global.game_room == 11 ) instance_destroy();

var _mx = mean( x1, x2 );
var _my = mean( y1, y2 );

var _dir = point_direction( _mx, _my, mean( obj_floor.x1, obj_floor.x2 ), mean( obj_floor.y1, obj_floor.y2 ) );
_dir = round( _dir/90 )*90;
swell_x = lengthdir_x( global.game_swell, _dir );
swell_y = lengthdir_y( global.game_swell, _dir );