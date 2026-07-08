function scr_textos(){
	switch npc_nome {
		case "Pai":
			ds_grid_add_text("Iara, volte a dormir!", sIconMae, 1, "Mãe");
			ds_grid_add_text("Está muito cedo, eu e sua mãe estamos indo trabalhar", sIconPai, 1, "Pai");
			ds_grid_add_text("Vocês estavam brigando denovo?", sIconIaraPreocupada, 0, "Iara");
			ds_grid_add_text("Isso não te interessa Iara!", sIconMae, 1, "Mãe");
			ds_grid_add_text("Agora se comporte, senão a CUCA aparece...", sIconPai, 1, "Pai");
			ds_grid_add_text("Para pai! Você sabe que eu tenho medo dessas coisas de folclore", sIconIaraPreocupada, 0, "Iara");
			ds_grid_add_text("Então é melhor me obedecer...", sIconPai, 1, "Pai");
			acao_final = "terminou_conversa_pai";
		break;
		
		case "SustoQuarto":
			ds_grid_add_text("Que barulho foi esse?!", sIconIaraPreocupada, 0, "Iara");
			ds_grid_add_text("Eles devem estar brigando denovo...", sIconIaraPreocupada, 0, "Iara");
		break;

		case "SustoFloresta":
		    ds_grid_add_text("AH! Onde... onde eu estou?!", sIconIaraPreocupada, 0, "Iara");
		    ds_grid_add_text("Isso não é o meu quarto!", sIconIaraPreocupada, 0, "Iara");
		break;

		case "Cama":
			if (room == rm_floresta1) { 
			 ds_grid_add_text("Eu não vou dormir no meio do mato! Estou aterrorizada.",sIconIaraPreocupada, 0, "Iara");
			 } 
			 else {
			if (global.falou_com_pai == false) {
            ds_grid_add_text("Preciso ver o que está acontecendo...", sIconIara, 0, "Iara");
			} else {
            ds_grid_add_text("Realmente estou com muito sono, acho que vou voltar a dormir...", sIconIara, 0, "Iara");
            acao_final = "ir_dormir_floresta"; 
			 }
			}
			break;
		
		case "SaciLouco":
			ds_grid_add_text("Achou que ia passar batido, menina?!", sIconSaciLouco, 1, "Saci"); 
		break;
		
		case "SaciDerrotado":
			ds_grid_add_text("Me desculpe menina, não quis te machucar!", sIconSaciDerrotado, 1, "Saci");
			ds_grid_add_text("Você está se desculpando??", sIconIaraPreocupada, 0, "Iara");
			ds_grid_add_text("Eu apenas gosto de fazer travessuras, mas estava fora de controle...", sIconSaciDerrotado, 1, "Saci");
			ds_grid_add_text("Obrigado por me libertar...", sIconSaciDerrotado, 1, "Saci");
			ds_grid_add_text("O que aconteceu com você???", sIconIaraPreocupada, 0, "Iara");
			ds_grid_add_text("Eu tava em algum tipo de transe, não sei dizer ao certo", sIconSaciDerrotado, 1, "Saci");
			ds_grid_add_text("Provavelmente não sou só eu que estou assim, pegue esse cipó, ele podera te ajudar", sIconSaciDerrotado, 1, "Saci");
			ds_grid_add_text("Obrigada...", sIconIaraPreocupada, 0, "Iara");
			acao_final = "ganhar_cipo";
		break;
		
		case "CurupiraLouco":
			ds_grid_add_text("A sua presença amaeça a floresta", sIconCurupiraLouco, 1, "Curupira");
			ds_grid_add_text("Não posso deixar você passar!", sIconCurupiraLouco, 1, "Curupira");
			ds_grid_add_text("Por favor, não me machuca!", sIconIaraPreocupada, 0, "Iara");
		break;
		
		case "CurupiraDerrotado":
			ds_grid_add_text("Me desculpe garota", sIconCurupiraDerrotado, 1, "Curupira");
			ds_grid_add_text("No final das contas era eu que estava machucando a floresta...", sIconCurupiraDerrotado, 1, "Curupira");
			ds_grid_add_text("O que esta acontecendo com vocês, o Saci também estava assim!", sIconIara, 0, "Iara");
			ds_grid_add_text("Eu não sei, mas sinto que a Cuca tem algo haver com isso", sIconCurupiraDerrotado, 1, "Curupira");
			ds_grid_add_text("Você não quis me machucar de verdade??", sIconIaraPreocupada, 0, "Iara");
			ds_grid_add_text("Claro que não! Apenas puno aqueles que fazem mal a floresta", sIconCurupiraDerrotado, 1, "Curupira");
			ds_grid_add_text("Eu preciso ir atás da Cuca eu acho... Só assim saberei como voltar pra casa", sIconIaraPreocupada, 0, "Iara");
			ds_grid_add_text("Boa sorte garota, e cuidado!!", sIconCurupiraDerrotado, 1, "Curupira");
		break;
		
		case "PegouFruta":
			ds_grid_add_text("Pegou uma fruta", sFruta, 1, "Arvore");
		break;
		
		case "ArvoreVazia":
			ds_grid_add_text("A arvore está sem frutas", sFruta, 1, "Arvore");
		break;
		
		case "Cuca_Inicio":
		    ds_grid_add_text("Você! Mais uma criança para sujar e destruir a minha floresta!",sIconCucaLouca, 1, "Cuca");
		    ds_grid_add_text("Eu vou transformar você em ensopado agora mesmo!", sIconCucaLouca, 1, "Cuca");
			ds_grid_add_text("AAAAAAAAAAAAAA!!", sIconIaraDefesa, 1, "Iara");
		break;

		case "Cuca_Acerto_1":
		    ds_grid_add_text("Calma! Eu não vim fazer mal a você!", sIconIara, 0, "Iara");
		    ds_grid_add_text("Mentira! Vocês humanos só sabem destruir!", sIconCucaLouca, 1, "Cuca");
		break;
		case "Cuca_Acerto_2":
		    ds_grid_add_text("Por favor, escuta! Eu só quero voltar pra casa!", sIconIara, 0, "Iara");
		break;
		case "Cuca_Acerto_3":
		    ds_grid_add_text("PARE! A floresta também está sofrendo com toda essa raiva!", sIconIara, 0, "Iara");
		break;
		case "Cuca_Acerto_4":
		    ds_grid_add_text("Nós podemos resolver isso sem brigar! Por favor!", sIconIaraPreocupada, 0, "Iara");
		break;

		case "CucaDerrotada":
		    ds_grid_add_text("POR QUE VOCÊ NÃO ATACA?!", sIconCucaDerrotada, 1, "Cuca");
		    ds_grid_add_text("As crianças não acreditam mais na gente... O folclore está desaparecendo.", sIconCucaDerrotada, 1, "Cuca");
		    ds_grid_add_text("Tudo o que eu fiz foi tentar manter nossa memória viva, mesmo que fosse pelo medo.", sIconCucaDerrotada, 1, "Cuca");
		    ds_grid_add_text("Mas você é diferente. Você tentou me entender... Vá. Volte para sua casa.", sIconCucaDerrotada, 1, "Cuca");
			ds_grid_add_text("Muito obrigada. A partir de hoje eu não temo mais vocês, eu entendo a importancia de cada um", sIconIara, 1, "Iara");
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