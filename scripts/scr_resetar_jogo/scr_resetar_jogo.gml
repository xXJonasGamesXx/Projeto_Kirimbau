function resetar_jogo_todo() {
    // 1. Zera a história
    global.dialogo = false;
    global.acordou_quarto = false;
    global.acordou_floresta = false;
    global.falou_com_pai = false;
    
    if (variable_global_exists("cuca_derrotada")) global.cuca_derrotada = false;
    if (variable_global_exists("curupira_derrotado")) global.curupira_derrotado = false;
	if (variable_global_exists("saci_derrotado")) global.saci_derrotado = false;
    
    for (var i = 0; i < INVENTORY_SLOTS; i += 1) {
        global.inventory[i] = -1;
    }
    
    if (variable_global_exists("party")) {
        global.party[0].hp = global.party[0].hpMax;
    }
}