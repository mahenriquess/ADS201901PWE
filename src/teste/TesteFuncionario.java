package teste;

import java.sql.ResultSet;
import java.sql.SQLException;
import dao.FuncionarioDAO;
import entidades.Funcionario;

public class TesteFuncionario {
	
	public static void main(String[] args) {
		Funcionario func = new Funcionario("","Felipe","feh029","felipeeh","felipe@teste.com","B","S");
		Funcionario funcLogin = new Funcionario("joao07", "a1b2c3d4");
		FuncionarioDAO funcDao = new FuncionarioDAO();
		
		boolean teste = false;
		ResultSet rs = null;
		
		teste = funcDao.inserirFuncionario(func.toArray());
		
		//teste = funcDao.atualizarFuncionario(func.toArray());
		
		//teste = funcDao.removerFuncionario(func.getFuncID());
		
		rs = funcDao.selecionarFuncionarios("");
		
		//rs = funcDao.login(funcLogin.getFuncUsername(), funcLogin.getFuncPassword());
		
		try {
			if(!rs.isBeforeFirst()) {
				System.out.println("LOGIN INCORRETO");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			while(rs.next()) {
				try {
					String id = rs.getString("funcID");
					String nome = rs.getString("funcNome");
					String user = rs.getString("funcUsername");
					String pass = rs.getString("funcPassword");
					String ativo = rs.getString("funcAtivo");
					
					System.out.println(id + " - " + nome + " - " + pass);
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
