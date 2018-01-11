/// @description Adds a depth surface to a GRIP camera
/// @param name

if ( !GRIP_ON ) {
    trace_error_q( false, "Can't execute script - turn GRIP on" );
    exit;
}

if ( !ALLOW_MRT ) trace_error_q( false, "Caution! Adding a depth surface when MRTs are disabled!" );

var _name = argument0;
var _map = global.grip_cameras_map[? argument0 ];
_map[? "depth surface" ] = tr_surface_create( grip_get_width( _name ), grip_get_height( _name ),
                                              concat( "grip (depth): ", QU, argument0, QU ), true );