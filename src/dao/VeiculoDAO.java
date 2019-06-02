package dao;

import java.sql.ResultSet;
import database.DAO;
import entidades.Veiculo;

public class VeiculoDAO extends DAO {

	public VeiculoDAO() {
		this.tableFields = new String[]{"veiID", "veiPlaca", "veiMarca", "veiModelo","veiCor","veiCategoria", "veiAno", "veiValorLocacao", "veiCombustivel", "veiSituacao", "veiObservacao", "veiKM"};
		this.tableName = "tbpwe_veiculos";
	}
	
	public boolean inserirVeiculo(String[] dados) {
		boolean resultado = super.insert(dados);
		return resultado;
	}
	
	public boolean atualizarVeiculo(String[] dados) {
		boolean resultado = super.update(dados);
		return resultado;
	}
	
	public boolean atualizarVeiculoStatus(String valor, String campo, String id) {
		boolean resultado = super.updateField(valor, campo, id);
		return resultado;
	}
	
	public boolean removerVeiculo(String id) {
		boolean resultado = super.delete(id);
		return resultado;
	}
	
	public ResultSet selecionarVeiculo(String restricao) {
		ResultSet rs = super.select(restricao);
		return rs;
	}
	
}
