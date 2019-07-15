package board;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbManager.dbConnertion;


public class BoardDAO {
	
	PreparedStatement pstmt;
	Connection con;
	ResultSet rs;

	//게시판 글등록
	public int insertBoard(BoardBean bb) {
		int result = 0;
		try {
			//현재 게시판 값을 최대값+1을 가져 온다
			int num = boardMaxNum();
			
			//DB연결
			con  =   dbConnertion.dbConn();

			//3단계 sql(insert) 만들고 실행할 객체 생성
			String sql = " Insert into board(num,name,pass,subject,content,readcont,reg_date,file) "
					+ "values(?,?,?,?,?,?,now(),?)"; //Statement 형태
			//String sql = " Insert into board(num,name,pass,subject,content,readcont) values(?,?,?,?,?,?)"; //Statement 형태
			pstmt = con.prepareStatement(sql);

			//4단계 sql 실행
			//pstmt.setInt(1, bb.getNum());
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName()); 
			pstmt.setString(3, bb.getPass()); 
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcont()); 
			pstmt.setString(7, bb.getFile());
			//pstmt.setDate(7, bb.getReg_date());
			//pstmt.setString(7, "now()");

			//4단계 : sql 구분 실행 (insert, update, delete)
			result = pstmt.executeUpdate();
		
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		finally {
			//마무리 작업 //기억장소 com  pstmt rs정리
			dbConnertion.dbClose(rs,pstmt,con);
			
		}
		return result;
	}
	
	//게시판 번호 가져 오기
	public int boardMaxNum() {
		int result=0;
		try {
			con  =   dbConnertion.dbConn();
			// 범용으로 사용하기 위해서는 아래 방식으로 해야 한다?
			//String sql = " select ifnull(max(num),0)+1 as num from board ";
			String sql = " select max(num) as num from board ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("num")+1;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			//마무리 작업 //기억장소 com  pstmt rs정리
			dbConnertion.dbClose(rs,pstmt,con);
		}
		
		return result;
	}
	//게시판 리스트
	public List getBoradList() {
		List boardList = new ArrayList();
		
		
		try {
			con  =   dbConnertion.dbConn();
			//DB연결 4단계
			String sql = " select * from board order by num desc"; //Statement 형태
			pstmt = con.prepareStatement(sql);
			
			//4단계 : sql 구분 실행 (insert, update, delete)
			//결과 저장 <= sql 구문 실행 select 변수 = pstmt.executeQuery();
			rs = pstmt.executeQuery();
			while(rs.next()){
				// 한사람의 정보를 저장할 객체 생성
				BoardBean bb = new BoardBean();
				
				//한사람의 객체생성한 기억장소에 저장
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcont(rs.getInt("readcont"));
				bb.setReg_date(rs.getDate("reg_date"));
				
				// 정보를 배열 한칸에 저장
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			//마무리 작업 //기억장소 com  pstmt rs정리
			dbConnertion.dbClose(rs,pstmt,con);
		}
		
		return boardList; 
		
	}
	//게시판 리스트
		public List getBoradList(int strRow, int pageSize) {
			List boardList = new ArrayList();
			
			
			try {
				con  =   dbConnertion.dbConn();
				//DB연결 4단계
				//limit 시작행 -1. 한화면에 보여줄 글자수
				//String sql = "select * from board order by num desc limit "+ (strRow -1) +","+pageSize; //Statement 형태
				String sql = "select * from board order by num desc limit ?,?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, strRow -1); //첫째물음표, 값
				pstmt.setInt(2, pageSize); //첫째물음표, 값
				
				//System.out.println(pstmt);
				//4단계 : sql 구분 실행 (insert, update, delete)
				//결과 저장 <= sql 구문 실행 select 변수 = pstmt.executeQuery();
				rs = pstmt.executeQuery();
				while(rs.next()){
					// 한사람의 정보를 저장할 객체 생성
					BoardBean bb = new BoardBean();
					
					//한사람의 객체생성한 기억장소에 저장
					bb.setNum(rs.getInt("num"));
					bb.setName(rs.getString("name"));
					bb.setPass(rs.getString("pass"));
					bb.setSubject(rs.getString("subject"));
					bb.setContent(rs.getString("content"));
					bb.setReadcont(rs.getInt("readcont"));
					bb.setReg_date(rs.getDate("reg_date"));
					
					// 정보를 배열 한칸에 저장
					boardList.add(bb);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				//마무리 작업 //기억장소 com  pstmt rs정리
				dbConnertion.dbClose(rs,pstmt,con);
			}
			
			return boardList; 
			
		}
	// 게시판 내용 가져 오기
	public BoardBean getBoard(BoardBean bb) {
		//ResultSet rs = null;
		try {
			
			
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = " select * from board where num = ?"; //Statement 형태
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum()); //첫째물음표, 값
			
			//4단계 : sql 구분 실행 (insert, update, delete)
			//결과 저장 <= sql 구문 실행 select 변수 = pstmt.executeQuery();
			rs = pstmt.executeQuery();
			bb = new BoardBean();
			
			if(rs.next()) {
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcont(rs.getInt("readcont"));
				bb.setReg_date(rs.getDate("reg_date"));
				bb.setFile(rs.getString("file"));
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		finally {
			//마무리 작업 //기억장소 com  pstmt rs정리
			dbConnertion.dbClose(rs,pstmt,con);
		}
		
		return bb; 
	}
	//게시판 조회수 업데이트
	public void updateReadcont(BoardBean bb) {
		try {
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = "update board set readcont = readcont+1 where num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getNum()); //첫번째 물음표 값
			
			//4단계 : sql 구분 실행 (insert, update, delete)
			pstmt.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		finally {
			//마무리 작업 //기억장소 com  pstmt rs정리
			dbConnertion.dbClose(rs,pstmt,con);
		}
	}
	
	//게시판 비밀번호 맞는지 확인
	public int boardCheckPass(BoardBean bb) {
		int result = 0;
		try {
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			
			//3단계 해당 게시판 비밀번호 가져오기
			String sql = " select pass from board where num = ?";// and pass = ? ";// where num = ? and name = ?"; //Statement 형태
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum()); //첫번째 물음표 값
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pass").equals(bb.getPass())){
					result=1;
				}
				else{
					result=0;
				}
			}
			else {
				result = -1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			//마무리 작업 //기억장소 com  pstmt rs정리
			dbConnertion.dbClose(rs,pstmt,con);
		}
		
		return result;
	}
	//게시판 업데이트
	public int updateBoard(BoardBean bb) {
		int result = 0;
		try {
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = "update board set subject = ? ,content = ?, name= ?  where num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bb.getSubject()); //첫번째 물음표 값
			pstmt.setString(2, bb.getContent()); //첫번째 물음표 값
			pstmt.setString(3, bb.getName()); //첫번째 물음표 값
			pstmt.setInt(4, bb.getNum()); //첫번째 물음표 값
			
			//4단계 : sql 구분 실행 (insert, update, delete)
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		finally {
			//마무리 작업 //기억장소 com  pstmt rs정리
			dbConnertion.dbClose(rs,pstmt,con);
		}
		return result;
	}
	// 게시판 삭제
	public int deleteBoard(BoardBean bb) {
		int result = 0;
		try {
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = "delete from board where num=? and pass = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum()); //첫번째 물음표 값
			pstmt.setString(2, bb.getPass()); //첫번째 물음표 값
			//4단계 : sql 구분 실행 (insert, update, delete)
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		finally {
			//마무리 작업 //기억장소 com  pstmt rs정리
			dbConnertion.dbClose(rs,pstmt,con);
		}
		
		return result;
	}
	//게시판 번호 가져 오기
		public int getBoardCount() {
			int result=0;
			try {
				con  =   dbConnertion.dbConn();
				// 범용으로 사용하기 위해서는 아래 방식으로 해야 한다?
				String sql = " select count(*) as count from board ";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt("count");
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				//마무리 작업 //기억장소 com  pstmt rs정리
				dbConnertion.dbClose(rs,pstmt,con);
			}
			
			return result;
		}
	
	
			
}






























