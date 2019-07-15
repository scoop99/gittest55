package dbManager;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;
import code.CodeBean;

public class dbConnertion {

	public static Connection dbConn() throws Exception{
		
		/*
		Connection  con = null;
		
		//디비연결
		//1단계 드라이버 불러오기
		//: com폴더 mysql폴더 jdbc폴더 Driver.class
		Class.forName("com.mysql.jdbc.Driver");

		//2단계 디비연결
		// (디비주소, 디비접속아이디, 디비접속비밀번호)=> 연결정보 저장
		String dburl = "jdbc:mysql://scoop99.asuscomm.com:3306/jspdb5";
		String dbuser = "jspid";
		String dbPass="jsppass";
		con=DriverManager.getConnection(dburl, dbuser, dbPass);
		return con;
		*/
		
		// context.xml 불러오기 위한 자바파일 객체생
		Context init = new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB"); //위치/이름
		Connection con=ds.getConnection();
		return con;
		
		
	}
	
	//연결끊기
	public static void dbClose(ResultSet rs, PreparedStatement pstmt,Connection con ) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException ex) {}
		}
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException ex) {}
		}
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException ex) {}
		}
	}
	//타입에 따른 SQL문 작성
	public static String setSqlParameter(String type, String sql) {
		//insert 문
		if(type.toLowerCase().equals("insert")) {
			sql = sql.substring(0,sql.indexOf("values")).substring((sql.indexOf("(")+1)).trim();
			sql = sql.substring(0, sql.lastIndexOf(")"));
		}
		return sql;
	}
	public static String setSqlParameterValue(Object ob, Field[] fields) {
		String sql = "";
		String values ="";
		
		CodeBean cb = new CodeBean();
		

		if(ob instanceof CodeBean) {
			cb = (CodeBean)ob;
		}
		else if(ob instanceof BoardBean) {
			BoardBean bb = (BoardBean)ob;
		}
		
		//if(cb.e)
		
		
		
		
		//Class cls =cb.getClass();
		
		return sql;
	}
}





















