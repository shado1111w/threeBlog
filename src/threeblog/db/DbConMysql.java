package threeblog.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConMysql {
	// ��
	public Connection getCon() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		String url = "jdbc:mysql://192.168.196.148:3306/threeblog?useUnicode=true&characterEncoding=utf-8";

		try {
			con = DriverManager.getConnection(url, "guest", "123456");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	// ��
	
	public int insert(String sql) {
		Connection conn = getCon();
		Statement stt = null;
		int n = 0;
		try {
			conn.setAutoCommit(false);
			stt = conn.createStatement();
			n = stt.executeUpdate(sql);
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				stt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return n;
	}

	// ɾ

	public int delete(String sql) {
		int n = 0;
		Connection conn = getCon();
		Statement stt = null;
		try {
			conn.setAutoCommit(false);
			stt = conn.createStatement();
			n=stt.executeUpdate(sql);
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				stt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return n;
	}

	// ��

	public int update(String sql) {
		Connection conn = getCon();
		Statement stt = null;
		int n = 0;
		try {
			conn.setAutoCommit(false);
			stt = conn.createStatement();
			n = stt.executeUpdate(sql);
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				stt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return n;
	}
	
	// ��

	public ResultSet getQuery(String sql) {
		Connection conn = getCon();
		Statement stt = null;
		ResultSet rs = null;
		try {
			stt = conn.createStatement();
			rs = stt.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// ��

	public static void main(String[] args) throws SQLException {
		DbConMysql db = new DbConMysql();
		ResultSet rs = db.getQuery("select * from t_user ");
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnsNumber = rsmd.getColumnCount();
		try {
			while (rs.next()) {
				for (int i = 1; i <= columnsNumber; i++) {
					if (i > 1)
						System.out.print(",  ");
					String columnValue = rs.getString(i);
					System.out.print(rsmd.getColumnName(i) + ":" + columnValue);
				}
				System.out.println("");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
