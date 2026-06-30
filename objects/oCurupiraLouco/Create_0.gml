if (global.curupira_derrotado == true) {
    var _yFinal = 75; 
    
    var _inst = instance_create_layer(x, _yFinal, "Instances", oCurupiraDerrotado);
    _inst.npc_nome = "CurupiraDerrotado";
    
    instance_destroy();
    exit; 
}