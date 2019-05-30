package teste;

import java.sql.ResultSet;
import java.sql.SQLException;
import dao.ClienteDAO;
import entidades.Cliente;

public class TesteCliente {
	
	public static void main(String[] args) {
		Cliente cli = new Cliente("","Pizza","144.000.123-12","11.145.658-23","pizza@pizza.com","11987654321","F","N");
		ClienteDAO cliDao = new ClienteDAO();
		
		boolean teste = false;
		ResultSet rs = null;
		
		//teste = cliDao.inserirCliente(cli.toArray());
		
		//teste = cliDao.atualizarCliente(cli.toArray());
		
		//teste = cliDao.removerCliente(cli.getCliID());
		
		//rs = cliDao.selecionarClientes("");
		
		try {
			while(rs.next()) {
				try {
					String id = rs.getString("cliID");
					String nome = rs.getString("cliNome");
					String ativo = rs.getString("cliAtivo");
					
					System.out.println(id + " - " + nome + " - " + ativo);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(teste){
			System.out.println("DEU OK");
		} else {
			System.out.println("ERRO");
		}
	}
	
}
