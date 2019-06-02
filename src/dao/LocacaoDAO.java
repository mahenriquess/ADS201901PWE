package dao;

import java.sql.ResultSet;
import database.DAO;
import entidades.Locacao;

public class LocacaoDAO extends DAO {

	public LocacaoDAO() {
		this.tableFields = new String[]{"locacaoID","locacaoCli", "locacaoVeiculo","locacaoDataHora","locacaoDias", "locacaoValor", "locacaoDevolucao", "locacaoStatus"};
		this.tableName = "tbpwe_locacoes";
	}
	
	public boolean inserirLocacao(String[] dados) {
		boolean resultado = super.insert(dados);
		return resultado;
	}
	
	public boolean atualizarLocacao(String[] dados) {
		boolean resultado = super.update(dados);
		return resultado;
	}
	
	public boolean removerLocacao(String id) {
		boolean resultado = super.delete(id);
		return resultado;
	}
	
	public ResultSet selecionarLocacoes(String restricao) {
		ResultSet rs = super.select(restricao);
		return rs;
	}
}

