function scr_textos(){
	switch npc_nome {
		case "Pai":
			ds_grid_add_text("Iara, volte a dormir!", sIconPai, 1, "Pai");
			ds_grid_add_text("Está muito cedo, eu e sua mãe estamos indo trabalhar", sIconPai, 1, "Pai");
			ds_grid_add_text("Se comporte, senão a CUCA aparece...", sIconPai, 1, "Pai");
			acao_final = "terminou_conversa_pai";
		break;
		
		case "SustoQuarto":
			ds_grid_add_text("Que barulho foi esse?!", sIconIaraPreocupada, 0, "Iara");
			ds_grid_add_text("Tive um pesadelo horrível...", sIconIaraPreocupada, 0, "Iara");
		break;

		case "SustoFloresta":
		    ds_grid_add_text("AH! Onde... onde eu estou?!", sIconIaraPreocupada, 0, "Iara");
		    ds_grid_add_text("Isso não é o meu quarto!", sIconIaraPreocupada, 0, "Iara");
		break;

		case "Cama":
			if (room == rm_floresta1) { 
			 ds_grid_add_text("Eu não vou dormir no meio do mato! Preciso descobrir como voltar.",sIconIaraPreocupada, 0, "Iara");
			 } 
			 else {
			if (global.falou_com_pai == false) {
            ds_grid_add_text("Eu ainda preciso falar com o meu pai...", sIconIara, 0, "Iara");
			} else {
            ds_grid_add_text("Estou com muito sono, acho que já vou dormir...", sIconIara, 0, "Iara");
            acao_final = "ir_dormir_floresta"; 
			 }
			}
			break;
		
		case "SaciLouco":
			ds_grid_add_text("Achou que ia passar batido, menina?!", sIconSaciLouco, 1, "Saci"); 
		break;
		
		case "SaciDerrotado":
			ds_grid_add_text("Me desculpe menina, não quis te machucar!", sIconSaciDerrotado, 1, "Saci");
			ds_grid_add_text("Eu gosto de fazer travessuras, mas não machucar...", sIconSaciDerrotado, 1, "Saci");
			ds_grid_add_text("Obrigado por me libertar...", sIconSaciDerrotado, 1, "Saci");
			ds_grid_add_text("O que aconteceu com você???", sIconIaraPreocupada, 0, "Iara");
			ds_grid_add_text("Eu tava em algum tipo de transe, não sei dizer ao certo", sIconSaciDerrotado, 1, "Saci");
			ds_grid_add_text("Provavelmente não sou só eu que estou assim, pegue esse cipó, ele podera te ajudar", sIconSaciDerrotado, 1, "Saci");
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
		
		case "Cuca_Inicio":
		    ds_grid_add_text("Você! Mais uma criança para sujar e destruir a minha floresta!",sCucaDerrotada, 1, "Cuca");
		    ds_grid_add_text("Eu vou transformar você em ensopado agora mesmo!", sCucaDerrotada, 1, "Cuca");
		break;

		case "Cuca_Acerto_1":
		    ds_grid_add_text("Calma! Eu não vim fazer mal a você!", sIconIara, 0, "Iara");
		    ds_grid_add_text("Mentira! Vocês humanos só sabem destruir!", sCucaDerrotada, 1, "Cuca");
		break;
		case "Cuca_Acerto_2":
		    ds_grid_add_text("Por favor, escuta! Eu só quero voltar pra casa!", sIconIara, 0, "Iara");
		break;
		case "Cuca_Acerto_3":
		    ds_grid_add_text("PARE! A floresta também está sofrendo com toda essa raiva!", sIconIara, 0, "Iara");
		break;
		case "Cuca_Acerto_4":
		    ds_grid_add_text("Nós podemos resolver isso sem brigar! Eu prometo!", sIconIara, 0, "Iara");
		break;

		case "CucaDerrotada":
		    ds_grid_add_text("POR QUE VOCÊ NÃO ATACA?!", sCucaDerrotada, 1, "Cuca");
		    ds_grid_add_text("As crianças não acreditam mais na gente... O folclore está desaparecendo.", sCucaDerrotada, 1, "Cuca");
		    ds_grid_add_text("Tudo o que eu fiz foi tentar manter nossa memória viva, mesmo que fosse pelo medo.", sCucaDerrotada, 1, "Cuca");
		    ds_grid_add_text("Mas você é diferente. Você tentou me entender... Vá. Volte para sua casa.", sCucaDerrotada, 1, "Cuca");
		    acao_final = "cuca_invoca_cama";
		break;

		case "CamaFim":
			ds_grid_add_text("Acabou... acho que finalmente posso descansar.", sIconIara, 0, "Iara"); 
			acao_final = "dormir_e_zerar"; 
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