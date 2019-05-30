package teste;

import java.sql.ResultSet;
import java.sql.SQLException;

import dao.CategoriaVeiculosDAO;

public class TesteCategoria {
	public static void main(String[] args) {
		CategoriaVeiculosDAO catVei = new CategoriaVeiculosDAO();
		ResultSet rs = catVei.selecionarCategorias();
		
		try {
			while(rs.next()) {
				String id = rs.getString("catID");
				String nome = rs.getString("catNome");
				System.out.println(id + " - " + nome);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
