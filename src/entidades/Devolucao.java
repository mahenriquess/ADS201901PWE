package entidades;

public class Devolucao {	
	private String devolucaoID;
	private String devolucaoLocacao;
	private String devolucaoDataHora;
	private String devolucaoMulta;
	
	public Devolucao(String id, String locacao, String data, String multa) {
		this.devolucaoID = id;
		this.devolucaoLocacao = locacao;
		this.devolucaoDataHora = data;
		this.devolucaoMulta = multa;
	}

	public String getDevolucaoID() {
		return devolucaoID;
	}

	public void setDevolucaoID(String devolucaoID) {
		this.devolucaoID = devolucaoID;
	}

	public String getDevolucaoLocacao() {
		return devolucaoLocacao;
	}

	public void setDevolucaoLocacao(String devolucaoLocacao) {
		this.devolucaoLocacao = devolucaoLocacao;
	}

	public String getDevolucaoDataHora() {
		return devolucaoDataHora;
	}

	public void setDevolucaoDataHora(String devolucaoDataHora) {
		this.devolucaoDataHora = devolucaoDataHora;
	}

	public String getDevolucaoMulta() {
		return devolucaoMulta;
	}

	public void setDevolucaoMulta(String devolucaoMulta) {
		this.devolucaoMulta = devolucaoMulta;
	}

	public String[] toArray() {
		String[] dados = {this.getDevolucaoID(), this.getDevolucaoLocacao(), this.getDevolucaoDataHora(), this.getDevolucaoMulta()};
		return dados;
	}
	
}
