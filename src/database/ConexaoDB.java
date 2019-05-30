package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexaoDB {
	
	private String host = "hospedagem.ifspguarulhos.edu.br";
	private String port = "3306";
	private String user = "gu3000249";
	private String pass = "1MTzDVJXV1hQ6W4SNfx2brxW0b8T/qpG2btAeM5EatE=";
	private String schema = "gu3000249";
	public boolean isConnected = false;
	public Connection connection = null;
	
	public void conectar() {
		try {
			String url = "jdbc:mysql://"+this.host+":"+port+"/"+this.schema;
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			isConnected = true;
			this.connection = DriverManager.getConnection(url,this.user,this.pass); 
			System.out.println("Banco de dados Conectado!");		
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();	
		} catch (InstantiationException  e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
