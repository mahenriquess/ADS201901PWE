package dao;

import java.sql.ResultSet;

import database.DAO;

public class CategoriaVeiculosDAO extends DAO {
	public CategoriaVeiculosDAO() {
		this.tableFields = new String[]{"catID", "catNome"};
		this.tableName = "tbpwe_categoria";
	}
	
	public ResultSet selecionarCategorias() {
		ResultSet rs = super.select();
		return rs;
	}
	
	public ResultSet selecionarCategoriaID(String id) {
		ResultSet rs = super.select(id);
		return rs;
	}
}
