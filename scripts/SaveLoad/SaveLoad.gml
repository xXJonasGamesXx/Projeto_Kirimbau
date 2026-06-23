global.load_x = -1;
global.load_y = -1;

function SalvarJogo() {
    var _saveData = {
        sala: room,
        player_x: oIara.x,
        player_y: oIara.y
    };

    // 2. Transforma essa caixinha num texto JSON
    var _string = json_stringify(_saveData);

    var _file = file_text_open_write("savegame.json");
    file_text_write_string(_file, _string);
    file_text_close(_file);
    
    show_debug_message("Jogo Salvo com Sucesso!");
}

function CarregarJogo() {
    if (file_exists("savegame.json")) {
        
        instance_activate_all();
        
        var _file = file_text_open_read("savegame.json");
        var _string = file_text_read_string(_file);
        
        file_text_close(_file);

        var _saveData = json_parse(_string);

        global.load_x = _saveData.player_x;
        global.load_y = _saveData.player_y;

        // Vai para a sala que estava salva
        room_goto(_saveData.sala);
    } else {
        show_debug_message("Nenhum save encontrado!");
    }
}