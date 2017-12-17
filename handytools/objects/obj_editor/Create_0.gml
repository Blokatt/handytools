persistent = true;

window_show = EDITOR_START_OPEN;
window_collapsed = false;
window_has_set_size = false;
window_has_set_columns = false;
window_width = 940;
window_height = 700;
window_page = E_EDITOR_PAGE.HOME;
window_page_return = window_page;
window_name = "Editor";
window_state[0] = false;
window_state[1] = false;

preview_surface = tr_surface_create( 600, 600 );
preview_object = undefined;
preview_instance = noone;

selected_object = undefined;
selected_instance = noone;

place_x = 0;
place_y = 0;
place_z = 0;
place_a = 0;

floor_select_open = false;

instances_over = noone;

#region FLOOR SPRITES
floor_sprite_list = tr_list_create();
ds_list_add( floor_sprite_list, spr_tex_floor1 );
ds_list_add( floor_sprite_list, spr_tex_floor2 );
ds_list_add( floor_sprite_list, spr_tex_floor3 );
ds_list_add( floor_sprite_list, spr_tex_floor4 );
ds_list_add( floor_sprite_list, spr_tex_floor5 );
ds_list_add( floor_sprite_list, spr_tex_floor6 );
#endregion

#region WALL SPRITES
wall_sprite_list = tr_list_create();
ds_list_add( wall_sprite_list, spr_tex_wall6 );
ds_list_add( wall_sprite_list, spr_tex_wall7 );
ds_list_add( wall_sprite_list, spr_tex_wall8 );
#endregion

#region OBJECTS
object_list = tr_list_create();
ds_list_add( object_list, "GENERAL"              );
ds_list_add( object_list, obj_player_spawn       );
ds_list_add( object_list, obj_door_spawn         );
ds_list_add( object_list, obj_light              );
ds_list_add( object_list, obj_phone              );
ds_list_add( object_list, obj_dummy_phone        );
ds_list_add( object_list, "SEP"                  );

ds_list_add( object_list, "DECORATIONS"          );
ds_list_add( object_list, obj_chair              );
ds_list_add( object_list, obj_table              );
ds_list_add( object_list, obj_pedestal           );
ds_list_add( object_list, obj_bottle             );
ds_list_add( object_list, obj_cup                );
ds_list_add( object_list, obj_couch              );
ds_list_add( object_list, obj_bookshelf          );
ds_list_add( object_list, obj_open_book          );

ds_list_add( object_list, ""                     );
ds_list_add( object_list, "LIGHTS"               );
ds_list_add( object_list, obj_floor_lamp         );
ds_list_add( object_list, obj_desk_lamp          );
ds_list_add( object_list, obj_hanging_bulb       );

ds_list_add( object_list, ""                     );
ds_list_add( object_list, "SPIRALS"              );
ds_list_add( object_list, obj_spiral1            );
ds_list_add( object_list, obj_spiral1_ceiling    );
ds_list_add( object_list, obj_spiral2            );
ds_list_add( object_list, obj_spiral2_ceiling    );
ds_list_add( object_list, "SEP"                  );

ds_list_add( object_list, "MIRROR ROOM"          );
ds_list_add( object_list, obj_mirror_frame       );
ds_list_add( object_list, obj_dummy_mirror_frame );

ds_list_add( object_list, ""                     );
ds_list_add( object_list, "ROPE ROOM"            );
ds_list_add( object_list, obj_scissors           );
ds_list_add( object_list, obj_rope               );
ds_list_add( object_list, obj_rope_pole          );

ds_list_add( object_list, ""                     );
ds_list_add( object_list, "HAMMER ROOM"          );
ds_list_add( object_list, obj_vase1              );
ds_list_add( object_list, obj_vase2              );
ds_list_add( object_list, obj_hammer             );

ds_list_add( object_list, ""                     );
ds_list_add( object_list, "FLOWER ROOM"          );
ds_list_add( object_list, obj_flower_pot         );
ds_list_add( object_list, obj_flower1            );
ds_list_add( object_list, obj_flower2            );
ds_list_add( object_list, obj_flower3            );
ds_list_add( object_list, obj_flower4            );
ds_list_add( object_list, obj_flower5            );
ds_list_add( object_list, obj_dead_tree          );
ds_list_add( object_list, "SEP"                  );

ds_list_add( object_list, "ENDING"               );
ds_list_add( object_list, obj_chessboard         );
ds_list_add( object_list, obj_chess_king         );
ds_list_add( object_list, obj_chess_queen        );
ds_list_add( object_list, obj_chess_rook         );
ds_list_add( object_list, obj_chess_king_alt     );
ds_list_add( object_list, obj_chess_queen_alt    );
ds_list_add( object_list, obj_chess_rook_alt     );
ds_list_add( object_list, obj_skele              );
#endregion