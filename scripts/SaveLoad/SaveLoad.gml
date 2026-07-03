global.load_x = -1;
global.load_y = -1;

function SalvarJogo() {
    var _saveData = {
        sala: room,
        player_x: oIara.x,
        player_y: oIara.y,
		
		vida_iara: global.party[0].hp,
        
        falou_com_pai: global.falou_com_pai,
        curupira_derrotado: global.curupira_derrotado,
        
        inventario: global.inventory, 
        
        garrafa_pega: global.pegou_garrafa,
		
		arvore_1: global.arvore_1_vazia,
        arvore_2: global.arvore_2_vazia,
        arvore_3: global.arvore_3_vazia
    };

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
		
		global.party[0].hp = _saveData.vida_iara;
        
        global.falou_com_pai = _saveData.falou_com_pai;
        global.curupira_derrotado = _saveData.curupira_derrotado;
        global.inventory = _saveData.inventario;
        global.pegou_garrafa = _saveData.garrafa_pega;
        
        global.arvore_1_vazia = _saveData.arvore_1;
        global.arvore_2_vazia = _saveData.arvore_2;
        global.arvore_3_vazia = _saveData.arvore_3;

        if (!instance_exists(oInventory)) {
            instance_create_depth(0, 0, -9999, oInventory); 
        }

        room_goto(_saveData.sala);
        
    } else {
        show_debug_message("Nenhum save encontrado!");
    }
}