global.dialogo = false;
global.falou_com_pai = false;

if (!variable_global_exists("derrotas_iniciadas")) {
    global.derrotas_iniciadas = true; 
    global.curupira_derrotado = false;
    global.saci_derrotado = false;
    global.cuca_derrotada = false;
}