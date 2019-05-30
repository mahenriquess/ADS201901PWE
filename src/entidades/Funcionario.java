package entidades;

public class Funcionario {
	
	private String funcID;
	private String funcNome;
	private String funcUsername;
	private String funcPassword;
	private String funcEmail;
	private String funcStatus;
	private String funcAtivo;

	public Funcionario(String id, String nome, String user, String pass, String email, String status, String ativo) {
		this.funcID = id;
		this.funcNome = nome;
		this.funcUsername = user;
		this.funcPassword = pass;
		this.funcEmail = email;
		this.funcStatus = status;
		this.funcAtivo = ativo;
		
		this.toArray();
	}
	
	public Funcionario(String user, String pass) {
		this.funcUsername = user;
		this.funcPassword = pass;
	}
	
	public String getFuncID() {
		return funcID;
	}
	public void setFuncID(String funcID) {
		this.funcID = funcID;
	}
	public String getFuncNome() {
		return funcNome;
	}
	public void setFuncNome(String funcNome) {
		this.funcNome = funcNome;
	}
	public String getFuncUsername() {
		return funcUsername;
	}
	public void setFuncUsername(String funcUsername) {
		this.funcUsername = funcUsername;
	}
	public String getFuncPassword() {
		return funcPassword;
	}
	public void setFuncPassword(String funcPassword) {
		this.funcPassword = funcPassword;
	}
	public String getFuncEmail() {
		return funcEmail;
	}
	public void setFuncEmail(String funcEmail) {
		this.funcEmail = funcEmail;
	}
	public String getFuncStatus() {
		return funcStatus;
	}

	public void setFuncStatus(String funcStatus) {
		this.funcStatus = funcStatus;
	}

	public String getFuncAtivo() {
		return funcAtivo;
	}
	public void setFuncAtivo(String funcAtivo) {
		this.funcAtivo = funcAtivo;
	}
	
	public String[] toArray() {
		String[] dados = {this.getFuncID(), this.getFuncNome(), this.getFuncUsername(), this.getFuncPassword(), this.getFuncEmail(), this.getFuncStatus(), this.getFuncAtivo()};
		return dados;
	}
	
}
