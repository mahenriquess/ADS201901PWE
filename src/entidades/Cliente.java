package entidades;

public class Cliente {
	private String cliID;
	private String cliNome;
	private String cliCPF;
	private String cliRG;
	private String cliEmail;
	private String cliTelefone;
	private String cliSexo;
	private String cliAtivo;
	
	public Cliente(String id, String nome, String cpf, String rg, String email, String tel, String sexo, String ativo) {
		this.cliID = id;
		this.cliNome = nome;
		this.cliCPF = cpf;
		this.cliRG = rg;
		this.cliEmail = email;
		this.cliTelefone = tel;
		this.cliSexo = sexo;
		this.cliAtivo = ativo;
	}
	
	public String getCliID() {
		return cliID;
	}
	public void setCliID(String cliID) {
		this.cliID = cliID;
	}
	public String getCliNome() {
		return cliNome;
	}
	public void setCliNome(String cliNome) {
		this.cliNome = cliNome;
	}
	public String getCliCPF() {
		return cliCPF;
	}
	public void setCliCPF(String cliCPF) {
		this.cliCPF = cliCPF;
	}
	public String getCliRG() {
		return cliRG;
	}
	public void setCliRG(String cliRG) {
		this.cliRG = cliRG;
	}
	public String getCliEmail() {
		return cliEmail;
	}
	public void setCliEmail(String cliEmail) {
		this.cliEmail = cliEmail;
	}
	public String getCliTelefone() {
		return cliTelefone;
	}
	public void setCliTelefone(String cliTelefone) {
		this.cliTelefone = cliTelefone;
	}
	public String getCliSexo() {
		return cliSexo;
	}
	public void setCliSexo(String cliSexo) {
		this.cliSexo = cliSexo;
	}
	public String getCliAtivo() {
		return cliAtivo;
	}

	public void setCliAtivo(String cliAtivo) {
		this.cliAtivo = cliAtivo;
	}
	
	public String[] toArray() {
		String[] dados = {this.getCliID(), this.getCliNome(), this.getCliCPF(), this.getCliRG(), this.getCliEmail(), this.getCliTelefone(), this.getCliSexo(), this.getCliAtivo()};
		return dados;
	}
	
}
