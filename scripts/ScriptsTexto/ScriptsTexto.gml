function scr_textos(){
	switch npc_nome {
		case "Pai":
			ds_grid_add_text("Iara, volte a dormir!", sIconPai, 1, "Pai");
			ds_grid_add_text("Está muito cedo, eu e sua mãe estamos indo trabalhar", sIconPai, 1, "Pai");
			ds_grid_add_text("Se comporte, senão a CUCA aparece...", sIconPai, 1, "Pai");
			acao_final = "terminou_conversa_pai";
		break;
		
		case "SustoQuarto":
			ds_grid_add_text("Que barulho foi esse?!", Iara_ParadaF, 0, "Iara");
			ds_grid_add_text("Tive um pesadelo horrível...", Iara_ParadaF, 0, "Iara");
		break;

		case "SustoFloresta":
		    ds_grid_add_text("AH! Onde... onde eu estou?!", Iara_ParadaF, 0, "Iara");
		    ds_grid_add_text("Isso não é o meu quarto!", Iara_ParadaF, 0, "Iara");
		break;

		case "Cama":
			if (room == rm_floresta1) { 
			 ds_grid_add_text("Eu não vou dormir no meio do mato! Preciso descobrir como voltar.", Iara_ParadaF, 0, "Iara");
			 } 
			 else {
			if (global.falou_com_pai == false) {
            ds_grid_add_text("Eu ainda preciso falar com o meu pai...", Iara_ParadaF, 0, "Iara");
			} else {
            ds_grid_add_text("Estou com muito sono, acho que já vou dormir...", Iara_ParadaF, 0, "Iara");
            acao_final = "ir_dormir_floresta"; 
			 }
			}
			break;
		
		case "SaciLouco":
			ds_grid_add_text("Achou que ia passar batido, menina?!", sSaciLouco, 1, "Saci"); 
		break;
		
		case "SaciDerrotado":
			ds_grid_add_text("Me desculpe menina, não quis te machucar!", sSaciDerrotado, 1, "Saci");
			ds_grid_add_text("Eu gosto de fazer travessuras, mas não machucar...", sSaciDerrotado, 1, "Saci");
			ds_grid_add_text("Obrigado por me libertar...", sSaciDerrotado, 1, "Saci");
			ds_grid_add_text("O que aconteceu com você???", Iara_ParadaF, 0, "Iara");
			ds_grid_add_text("Eu tava em algum tipo de transe, não sei dizer ao certo", sSaciDerrotado, 1, "Saci");
			ds_grid_add_text("Provavelmente não sou só eu que estou assim, pegue esse cipó, ele podera te ajudar", sSaciDerrotado, 1, "Saci");
			acao_final = "ganhar_cipo";
		break;
		
		case "CurupiraLouco":
			ds_grid_add_text("A sua presença amaeça a floresta", sCurupiraLouco, 1, "Curupira");
			ds_grid_add_text("Não posso deixar você passar!", sCurupiraLouco, 1, "Curupira");
		break;
		
		case "CurupiraDerrotado":
			ds_grid_add_text("Me desculpe garota", sCurupiraDerrotado, 1, "Curupira");
			ds_grid_add_text("No final das contas era eu que estava machucando a floresta...", sCurupiraDerrotado, 1, "Curupira");
			ds_grid_add_text("O que esta acontecendo com vocês, o Saci também estava assim!", Iara_ParadaF, 0, "Iara");
			ds_grid_add_text("Eu não sei, mas sinto que a Cuca tem algo haver com isso", sCurupiraDerrotado, 1, "Curupira");
			ds_grid_add_text("Eu vou atras dela! Não da mais.", Iara_ParadaF, 0, "Iara");
			ds_grid_add_text("Boa sorte garota, e cuidado!!", sCurupiraDerrotado, 1, "Curupira");
		break;
		
		case "PegouFruta":
			ds_grid_add_text("Pegou uma fruta", sFruta, 1, "Arvore");
		break;
		
		case "ArvoreVazia":
			ds_grid_add_text("A arvore está sem frutas", sFruta, 1, "Arvore");
		break;
		
	}
}


function ds_grid_add_row(){
///arg ds_grid

	var grid = argument[0];
	ds_grid_resize( grid,ds_grid_width( grid),ds_grid_height( grid)+1);
	return(ds_grid_height( grid)-1);
}

function ds_grid_add_text(){
////@arg texto 
////@arg retrato 
////@arg lado

	var grid = texto_grid;
	var _y = ds_grid_add_row(grid);

	grid[# 0, _y] = argument[0];
	grid[# 1, _y] = argument[1];
	grid[# 2, _y] = argument[2];
	grid[# 3, _y] = argument[3];
}