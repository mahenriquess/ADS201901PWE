package dao;

import java.sql.ResultSet;
import database.DAO;
import entidades.Cliente;

public class ClienteDAO extends DAO {
	
	public ClienteDAO() {
		this.tableFields = new String[]{"cliID","cliNome", "cliCPF","cliRG","cliEmail", "cliTelefone", "cliSexo", "cliAtivo"};
		this.tableName = "tbpwe_clientes";
	}
	
	public boolean inserirCliente(String[] dados) {
		boolean resultado = super.insert(dados);
		return resultado;
	}
	
	public boolean atualizarCliente(String[] dados) {
		boolean resultado = super.update(dados);
		return resultado;
	}
	
	public boolean removerCliente(String id) {
		boolean resultado = super.delete(id);
		return resultado;
	}
	
	public ResultSet selecionarClientes(String restricao) {
		ResultSet rs = super.select(restricao);
		return rs;
	}
}
