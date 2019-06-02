package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO extends ConexaoDB {

	protected String tableName;
	protected String[] tableFields;

	public DAO() {
		this.conectar();
	}

	protected boolean executeSql(String sql) {
		try {
			PreparedStatement stmt;
			stmt = connection.prepareStatement(sql);

			System.out.println(sql);

			int affectedRows = stmt.executeUpdate();

			if (affectedRows > 0) {
				return true;
			}

			return false;

		} catch (SQLException e) {

			e.printStackTrace();

			return false;
		}
	}

	protected ResultSet executeQuery(String sql) {
		Statement statement;
		try {
			statement = connection.createStatement();
			System.out.println(sql);
			return (statement.executeQuery(sql));
		} catch (SQLException e) {
			e.printStackTrace();
			return (null);
		}
	}

	public boolean insert(String[] values) {

		String cmdSql = "INSERT INTO " + this.tableName + "( ";

		for (int i = 1; i < this.tableFields.length; i++) {
			cmdSql += this.tableFields[i] + ((i == this.tableFields.length - 1) ? "" : ", ");
		}

		cmdSql += " ) VALUES ( ";
		for (int i = 1; i < values.length; i++) {
			cmdSql += "'" + values[i] + ((i == values.length - 1) ? "'" : "', ");
		}

		cmdSql += ")";

		boolean retorno = this.executeSql(cmdSql);

		return retorno;

	}

	public boolean update(String[] values) {

		String cmdSql = " UPDATE " + this.tableName + " SET ";

		for (int i = 1; i < this.tableFields.length; i++) {
			cmdSql += this.tableFields[i] + " = '" + values[i] + ((i == this.tableFields.length - 1) ? "'" : "', ");
		}

		cmdSql += " WHERE " + this.tableFields[0] + " = '" + values[0] + "'";

		boolean retorno = this.executeSql(cmdSql);

		return retorno;
	}
	
	public boolean updateField(String value, String field, String id) {

		String cmdSql = " UPDATE " + this.tableName + " SET ";

		cmdSql += field + " = '" + value + "'";
		cmdSql += " WHERE " + this.tableFields[0] + " = '" + id + "'";

		boolean retorno = this.executeSql(cmdSql);

		return retorno;
	}

	public boolean delete(String value) {
		
		String cmdSql = " DELETE FROM  " + this.tableName + " ";
		
		cmdSql += (value.isEmpty() ? "" : " WHERE " + this.tableFields[0] + " = '" + value + "'");
		
		boolean retorno = this.executeSql(cmdSql);

		return retorno;
	}

	public ResultSet select(String where) {
		
		String cmdSql = " SELECT ";
		
		for (int i = 0; i < this.tableFields.length; i++) {
			cmdSql += this.tableFields[i] + ((i == this.tableFields.length - 1) ? "" : ", ");
		}
		
		cmdSql += " FROM " + this.tableName + ((where.isEmpty()) ? "" : " WHERE " + where);
		
		ResultSet retorno = this.executeQuery(cmdSql);
		
		return retorno;
	}

	public ResultSet select() {
		return (this.select(""));
	}

	public void viewSelect() {
		ResultSet rs = select();
		try {
			while (rs.next()) {
				System.out.println("\n | " + rs.getString("idUsuario") + " | " + rs.getString("nome") + " | "
						+ rs.getString("senha") + " | ");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
