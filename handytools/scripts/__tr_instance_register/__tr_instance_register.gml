/// @description TRACKER internal function to remove an instance from global record
/// @param index
/// @param note
/// @param protect

if ( TRACKER_DEBUG_INSTANCE_CREATE && TRACKER_BLANK_NOTE_THROW_ERROR && (argument1 == "") ) trace_error( false, "blank note!" );

ds_list_add( global.tracker_instances, argument0 );
global.tracker_instances_origin[?    argument0 ] = tracker_origin_string();
global.tracker_instances_note[?      argument0 ] = string_space_padded_right( QU + argument1 + QU, TRACKER_NOTE_SPACE_PADDING );
global.tracker_instances_protect[?   argument0 ] = argument2;
global.tracker_instances_callstack[? argument0 ] = debug_get_callstack();