package dao;

import java.sql.ResultSet;
import database.DAO;
import entidades.Funcionario;

public class FuncionarioDAO extends DAO {
	public FuncionarioDAO() {
		this.tableFields = new String[]{"funcID","funcNome","funcUsername","funcPassword","funcEmail","funcStatus", "funcAtivo"};
		this.tableName = "tbpwe_funcionarios";
	}
	
	public boolean inserirFuncionario(String[] dados) {
		boolean resultado = super.insert(dados);
		return resultado;
	}
	
	public boolean atualizarFuncionario(String[] dados) {
		boolean resultado = super.update(dados);
		return resultado;
	}
	
	public boolean removerFuncionario(String id) {
		boolean resultado = super.delete(id);
		return resultado;
	}
	
	public ResultSet selecionarFuncionarios(String restricao) {
		ResultSet rs = super.select(restricao);
		return rs;
	}
	
	public ResultSet login(String usuario, String senha) {
		ResultSet rs = super.select("funcUsername='" + usuario + "' AND funcPassword='" + senha + "'");
		return rs;
	}
}
