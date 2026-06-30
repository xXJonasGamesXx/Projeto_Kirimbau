if (global.saci_derrotado == true) {
    var _yFinal = 70; 
    
    var _inst = instance_create_layer(x, _yFinal, "Instances", oSaciDerrotado);
    _inst.npc_nome = "SaciDerrotado";
    
    instance_destroy();
    exit; 
}