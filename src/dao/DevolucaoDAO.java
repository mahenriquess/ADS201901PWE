package dao;

import java.sql.ResultSet;
import database.DAO;
import entidades.Devolucao;

public class DevolucaoDAO extends DAO {

	public DevolucaoDAO() {
		this.tableFields = new String[]{"devolucaoID","devolucaoLocacao","devolucaoDataHora","devolucaoMulta"};
		this.tableName = "tbpwe_locacoes";
	}
	
	public boolean inserirDevolucao(String[] dados) {
		boolean resultado = super.insert(dados);
		return resultado;
	}
	
	public boolean atualizarDevolucao(String[] dados) {
		boolean resultado = super.update(dados);
		return resultado;
	}
	
	public boolean removerDevolucao(String id) {
		boolean resultado = super.delete(id);
		return resultado;
	}
	
	public ResultSet selecionarDevolucoes(String restricao) {
		ResultSet rs = super.select(restricao);
		return rs;
	}
}
