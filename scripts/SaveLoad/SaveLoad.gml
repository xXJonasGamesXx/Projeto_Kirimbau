global.load_x = -1;
global.load_y = -1;

function SalvarJogo() {
    var _saveData = {
        sala: room,
        player_x: oIara.x,
        player_y: oIara.y,
        
        vida_iara: global.party[0].hp,
        
        falou_com_pai: global.falou_com_pai,
        acordou_quarto: global.acordou_quarto,
        acordou_floresta: global.acordou_floresta,
        
        curupira_derrotado: global.curupira_derrotado,
        saci_derrotado: global.saci_derrotado,
        cuca_derrotada: global.cuca_derrotada,
        
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
        
        if (variable_struct_exists(_saveData, "vida_iara")) {
            global.party[0].hp = _saveData.vida_iara;
        }
        
        global.dialogo = false; 

        global.falou_com_pai = _saveData.falou_com_pai;
        global.inventory = _saveData.inventario;
        global.pegou_garrafa = _saveData.garrafa_pega;
        
        global.arvore_1_vazia = _saveData.arvore_1;
        global.arvore_2_vazia = _saveData.arvore_2;
        global.arvore_3_vazia = _saveData.arvore_3;
        
        if (variable_struct_exists(_saveData, "curupira_derrotado")) global.curupira_derrotado = _saveData.curupira_derrotado;
        if (variable_struct_exists(_saveData, "saci_derrotado")) global.saci_derrotado = _saveData.saci_derrotado;
        if (variable_struct_exists(_saveData, "cuca_derrotada")) global.cuca_derrotada = _saveData.cuca_derrotada;
        
        if (variable_struct_exists(_saveData, "acordou_quarto")) global.acordou_quarto = _saveData.acordou_quarto;
        if (variable_struct_exists(_saveData, "acordou_floresta")) global.acordou_floresta = _saveData.acordou_floresta;

        if (!instance_exists(oInventory)) {
            instance_create_depth(0, 0, -9999, oInventory); 
        }

        FadeToRoom(_saveData.sala, 60, c_black);
        
    } else {
        show_debug_message("Nenhum save encontrado!");
    }
}