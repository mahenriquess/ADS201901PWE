package entidades;

public class Veiculo {
	private String veiID;
	private String veiPlaca;
	private String veiMarca;
	private String veiModelo;
	private String veiCor;
	private String veiCategoria;
	private String veiAno;
	private String veiValorLocacao;
	private String veiCombustivel;
	private String veiSituacao;
	private String veiObservacao;
	
	public Veiculo(String id, String placa, String marca, String modelo, String cor, String categoria, String ano, String valorlocacao, String combustivel, String situacao, String observacao) {
		this.veiID = id;
		this.veiPlaca = placa;
		this.veiMarca = marca;
		this.veiModelo = modelo;
		this.veiCor = cor;
		this.veiCategoria = categoria;
		this.veiAno = ano;
		this.veiValorLocacao = valorlocacao;
		this.veiCombustivel = combustivel;
		this.veiSituacao = situacao;
		this.veiObservacao = observacao;
	
	}
	
	public String getVeiID() {
		return veiID;
	}
	public void setVeiID(String veiID) {
		this.veiID = veiID;
	}
	public String getVeiMarca() {
		return veiMarca;
	}
	public void setVeiMarca(String veiMarca) {
		this.veiMarca = veiMarca;
	}
	public String getVeiModelo() {
		return veiModelo;
	}
	public void setVeiModelo(String veiModelo) {
		this.veiModelo = veiModelo;
	}
	public String getVeiCor() {
		return veiCor;
	}
	public void setVeiCor(String veiCor) {
		this.veiCor = veiCor;
	}
	public String getVeiCategoria() {
		return veiCategoria;
	}
	public void setVeiCategoria(String veiCategoria) {
		this.veiCategoria = veiCategoria;
	}
	public String getVeiAno() {
		return veiAno;
	}
	public void setVeiAno(String veiAno) {
		this.veiAno = veiAno;
	}
	public String getVeiValorLocacao() {
		return veiValorLocacao;
	}
	public void setVeiValorLocacao(String veiValorLocacao) {
		this.veiValorLocacao = veiValorLocacao;
	}
	public String getVeiCombustivel() {
		return veiCombustivel;
	}
	public void setVeiCombustivel(String veiCombustivel) {
		this.veiCombustivel = veiCombustivel;
	}
	public String getVeiSituacao() {
		return veiSituacao;
	}
	public void setVeiSituacao(String veiSituacao) {
		this.veiSituacao = veiSituacao;
	}
	public String getVeiObservacao() {
		return veiObservacao;
	}
	public void setVeiObservacao(String veiObservacao) {
		this.veiObservacao = veiObservacao;
	}
	public String getVeiPlaca() {
		return veiPlaca;
	}

	public void setVeiPlaca(String veiPlaca) {
		this.veiPlaca = veiPlaca;
	}
	
	
	public String[] toArray() {
		String[] dados = {this.getVeiID(), this.getVeiPlaca(),this.getVeiMarca() ,this.getVeiModelo(), this.getVeiCor(), this.getVeiCategoria(), this.getVeiAno(), this.getVeiValorLocacao(), this.getVeiCombustivel(), this.getVeiSituacao(), this.getVeiObservacao()};
		return dados;
	}



}
