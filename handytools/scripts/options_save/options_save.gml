/// @description Saves options out to the options.txt file in local storage

string_save( OPTIONS_FILENAME, json_prettify_alphabetise( json_encode( global.options_json ) ) );