package entidades;

public class Locacao {
	private String locacaoID;
	private String locacaoCli;
	private String locacaoVeiculo;
	private String locacaoDataHora;
	private String locacaoDias;
	private String locacaoValor;
	private String locacaoDevolucao;
	private String locacaoStatus;	
	
	public Locacao(String id, String cliente, String veiculo, String data, String dias, String valor, String devolucao, String status) {
		this.locacaoID = id;
		this.locacaoCli = cliente;
		this.locacaoVeiculo = veiculo;
		this.locacaoDataHora = data;
		this.locacaoDias = dias;
		this.locacaoValor = valor;
		this.locacaoDevolucao = devolucao;
		this.locacaoStatus = status;
	}	
	
	public String getLocacaoID() {
		return locacaoID;
	}
	public void setLocacaoID(String locacaoID) {
		this.locacaoID = locacaoID;
	}
	public String getLocacaoCli() {
		return locacaoCli;
	}
	public void setLocacaoCli(String locacaoCli) {
		this.locacaoCli = locacaoCli;
	}
	public String getLocacaoVeiculo() {
		return locacaoVeiculo;
	}
	public void setLocacaoVeiculo(String locacaoVeiculo) {
		this.locacaoVeiculo = locacaoVeiculo;
	}
	public String getLocacaoDataHora() {
		return locacaoDataHora;
	}
	public void setLocacaoDataHora(String locacaoDataHora) {
		this.locacaoDataHora = locacaoDataHora;
	}
	public String getLocacaoDias() {
		return locacaoDias;
	}
	public void setLocacaoDias(String locacaoDias) {
		this.locacaoDias = locacaoDias;
	}
	public String getLocacaoValor() {
		return locacaoValor;
	}
	public void setLocacaoValor(String locacaoValor) {
		this.locacaoValor = locacaoValor;
	}


	public String getLocacaoDevolucao() {
		return locacaoDevolucao;
	}

	public void setLocacaoDevolucao(String locacaoDevolucao) {
		this.locacaoDevolucao = locacaoDevolucao;
	}

	public String getLocacaoStatus() {
		return locacaoStatus;
	}

	public void setLocacaoStatus(String locacaoStatus) {
		this.locacaoStatus = locacaoStatus;
	}
	
	public String[] toArray() {
		String[] dados = {this.getLocacaoID(), this.getLocacaoCli(), this.getLocacaoVeiculo(), this.getLocacaoDataHora(), this.getLocacaoDias(), this.getLocacaoValor(), getLocacaoDevolucao(), getLocacaoStatus()};
		return dados;
	}

	
}
