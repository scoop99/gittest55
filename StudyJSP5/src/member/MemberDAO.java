package member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbManager.dbConnertion;

public class MemberDAO {
	
	PreparedStatement pstmt;
	Connection con;
	ResultSet rs;
	
	//디비연결
	public Connection dbConn() {
		con = null;
		try {
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			
		}
		return con;
		
	}
	
	//회원등록
	public int insertMember(MemberBean mb) {
		int result = 0;
		try {
			//DB연결
			con  = dbConn();
			
			//dbConnertion dbcon = new dbConnertion();
			//Connection  con  = dbcon.dbConn();
			
			//3단계 sql(insert) 만들고 실행할 객체 생성
			String sql = " Insert into member(id,pass,name,reg_date) values(?,?,?,?)"; //Statement 형태
			pstmt = con.prepareStatement(sql);

			//4단계 sql 실행
			pstmt.setString(1, mb.getId()); //첫번째 물음표 값
			pstmt.setString(2, mb.getPass()); //두번째물음표, 값
			pstmt.setString(3, mb.getName()); //세번째물음표, 값
			pstmt.setTimestamp(4, mb.getReg_date()); //네번째물음표, 값

			//4단계 : sql 구분 실행 (insert, update, delete)
			result = pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		finally {
			
		}
		return result;
	}
	
	//회원 체크
	public int userCheck(MemberBean mb) {
		int result=-1;
		
		try {
			/*//디비연결 1단계
			//1단계 드라이버 불러오기
			//: com폴더 mysql폴더 jdbc폴더 Driver.class
			Class.forName("com.mysql.jdbc.Driver");

			//2단계 디비연결
			// (디비주소, 디비접속아이디, 디비접속비밀번호)=> 연결정보 저장
			String dburl = "jdbc:mysql://scoop99.asuscomm.com:3306/jspdb5";
			String dbuser = "jspid";
			String dbPass="jsppass";
			Connection  con=DriverManager.getConnection(dburl, dbuser, dbPass);*/
			
			//DB연결 2단계
			//Connection  con  = dbConn();
			
			//DB연결 3단계
			//dbConnertion dbcon = new dbConnertion();
			//Connection  con  =   dbcon.dbConn();
			
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			
			//3단계 sql(insert) 만들고 실행할 객체 생성
			String sql = " select * from member where id = ?";// and pass = ? ";// where num = ? and name = ?"; //Statement 형태
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId()); //첫번째 물음표 값

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pass").equals(mb.getPass())){
					result=1;
				}
				else{
					result=0;
				}
			}
			else {
				result = -1;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
		}
		return result;
	}
	
	//회원정보 가져 오기2
	public MemberBean getMember2(MemberBean mb) {
		//ResultSet rs = null;
		try {
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = " select * from member where id = ? "; //Statement 형태
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId()); //첫째물음표, 값
			
			//4단계 : sql 구분 실행 (insert, update, delete)
			//결과 저장 <= sql 구문 실행 select 변수 = pstmt.executeQuery();
			rs = pstmt.executeQuery();
			mb = new MemberBean();
			
			if(rs.next()) {
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {}
		
		return mb; 
	}
	//회원정보 가져오기
	public ResultSet getMember(MemberBean mb) {
		rs = null;
		
		try {
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = " select * from member where id = ? "; //Statement 형태
			
				
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId()); //첫째물음표, 값
			
			//4단계 : sql 구분 실행 (insert, update, delete)
			//결과 저장 <= sql 구문 실행 select 변수 = pstmt.executeQuery();
			rs = pstmt.executeQuery();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		finally {}
		
		return rs; 
	}
	
	//회원 업데이트
	public int updateMember(MemberBean mb) {
		int result = -1;
		
		try {
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = "update member set name = ? where  id = ? and pass = ?"; //Statement 형태
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getName()); //첫번째 물음표 값
			pstmt.setString(2, mb.getId()); //두번째물음표, 값
			pstmt.setString(3, mb.getPass()); //두번째물음표, 값

			//4단계 : sql 구분 실행 (insert, update, delete)
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {}
		
		return result;
	}
	
	//회원 삭제
	public int deleteMember(MemberBean mb) {
		int result = -1;
		
		try {
			
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = "delete from member where  id = ? and pass = ?"; //Statement 형태
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId()); //두번째물음표, 값
			pstmt.setString(2, mb.getPass()); //두번째물음표, 값

			//4단계 : sql 구분 실행 (insert, update, delete)
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {}
		
		return result;
		
	}
	
	//회원 리스트
	public ResultSet lisetMember() {
		rs = null;
		
		try {
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = " select * from member "; //Statement 형태
			pstmt = con.prepareStatement(sql);
			
			//4단계 : sql 구분 실행 (insert, update, delete)
			//결과 저장 <= sql 구문 실행 select 변수 = pstmt.executeQuery();
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		finally {}
		
		return rs; 
		
	}
	
	//회원 리스트
	public List getMamberList() {
		List memberList = new ArrayList();
		
		
		try {
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = " select * from member "; //Statement 형태
			pstmt = con.prepareStatement(sql);
			
			//4단계 : sql 구분 실행 (insert, update, delete)
			//결과 저장 <= sql 구문 실행 select 변수 = pstmt.executeQuery();
			rs = pstmt.executeQuery();
			while(rs.next()){
				// 한사람의 정보를 저장할 객체 생성
				MemberBean mb = new MemberBean();
				
				//한사람의 객체생성한 기억장소에 저장
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setPass(rs.getString("pass"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				
				// 한사람의 정보를 배열 한칸에 저장
				memberList.add(mb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {}
		
		return memberList; 
		
	}
			
}






























