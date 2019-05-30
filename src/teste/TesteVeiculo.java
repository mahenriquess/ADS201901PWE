package teste;

import java.sql.ResultSet;
import java.sql.SQLException;

import dao.CategoriaVeiculosDAO;
import dao.VeiculoDAO;
import entidades.Veiculo;

public class TesteVeiculo {
	
	public static void main(String[] args) {

		Veiculo vei = new Veiculo("20", "DFX5509", "Fiat", "Uno", "Azul", "1", "2001", "60.00", "Gasolina", "Disponivel", "Carro legal");
		VeiculoDAO veiDao = new VeiculoDAO();
		
		String id, nome, ativo, categoria, combustivel, categoriaNome = null;
		
		CategoriaVeiculosDAO catVei = new CategoriaVeiculosDAO();
		

		boolean teste = false;
		ResultSet rs = null;
		
		
		
		//teste = veiDao.inserirVeiculo(vei.toArray());

		//teste = veiDao.atualizarVeiculo(vei.toArray());
		
		//teste = veiDao.removerVeiculo(vei.getVeiID());
		
		rs = veiDao.selecionarVeiculo("");
		
			try {
				while(rs.next()) {
					ResultSet rsCat = catVei.selecionarCategoriaID("catID = '" + rs.getString("veiCategoria") + "'");
					
					while(rsCat.next()) {
						categoriaNome = rsCat.getString("catNome");
					}
					
					id = rs.getString("veiID");
					nome = rs.getString("veiModelo");
					ativo = rs.getString("veiSituacao");
					combustivel = rs.getString("veiCombustivel");
					categoria = categoriaNome;
					
					System.out.println(id + " - " + nome + " - " + ativo + " - " + combustivel + " - " + categoria);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		if(teste){
			System.out.println("DEU OK");
		} else {
			System.out.println("ERRO");
		}

	}

}

		