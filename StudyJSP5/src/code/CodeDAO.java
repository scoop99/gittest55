package code;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import cmsUtil.Util;
import dbManager.dbConnertion;


public class CodeDAO {
	
	PreparedStatement pstmt;
	Connection con;
	ResultSet rs;

	// 코드 등록
	public int insertCode(CodeBean cb) {
		int result = 0;
		try {

			//DB연결
			con  =   dbConnertion.dbConn();

			//3단계 sql(insert) 만들고 실행할 객체 생성
			String sql = "Insert into code ( "
					+"CODE_DIV"
					+",CODE"
					+",CODE_NAME"
					+",CODE_SML_NAME"
					+",ENG_NAME"
					+",ENG_SML_NAME"
					+",ORDER_SEQ"
					+",ORDER_SEQ1"
					+",USE_METHOD1"
					+",USE_METHOD2"
					+",USE_METHOD3"
					+",CODE_STEP"
					+",USE_YN"
					+",REMARK"
					+",DOMAIN"
					+",REGI_ID"
					+",REGI_IP_ADDR"
					+",REGI_DATE"
					+",MODIFIER_ID"
					+",MODIFIER_IP"
					+",MODIFIER_DATE)"
					+" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			//4단계 sql 실행
			Class cls = cb.getClass();
			Field[] fields = cls.getDeclaredFields();
			pstmt = con.prepareStatement(sql);
			
			//파라미터 사용할 변수 뽑기
			String parameter = dbConnertion.setSqlParameter("insert",sql);
			
			//파라미터 선언 및 할당
			String[] parameterValue = parameter.split(",");
			
			//파라멘트 선언
			int count =1;
			for(int j=0; j< parameterValue.length;j++) {
				for(int i = 0; i < fields.length; i++) {
		        	fields[i].setAccessible(true);
		        	if(Util.camelNotation(parameterValue[j]).equals(fields[i].getName().toString())) {
		        		switch (fields[i].getType().toString()) {
						case "class java.lang.String":
							if(fields[i].get((Object)cb)!=null) {
								pstmt.setString(count,fields[i].get((Object)cb).toString());
							}
							else {
								pstmt.setString(count,"");
							}
		            		count++;
							break;
						case "int":
							pstmt.setInt(count,Integer.parseInt(fields[i].get((Object)cb).toString()));
		            		count++;
							break;
						case "class java.sql.Timestamp":
							if(fields[i].get((Object)cb)!=null) {
								pstmt.setTimestamp(count, java.sql.Timestamp.valueOf(fields[i].get((Object)cb).toString()));
							}
							else {
								pstmt.setTimestamp(count,new Timestamp(System.currentTimeMillis()));
							}
		            		count++;
							break;	
						default:
							break;
						}
		        	}
		         }
			}
			
	         /*for(int i = 0; i < fields.length; i++) {
	        	fields[i].setAccessible(true);
	        	System.out.println(fields[i].getType().toString());
	        	System.out.println(fields[i].getName().toString());
	        	switch (fields[i].getType().toString()) {
				case "class java.lang.String":
					if(fields[i].get((Object)cb)!=null) {
						pstmt.setString(count,fields[i].get((Object)cb).toString());
					}
					else {
						pstmt.setString(count,"");
					}
            		count++;
					break;
				case "int":
					pstmt.setInt(count,Integer.parseInt(fields[i].get((Object)cb).toString()));
            		count++;
					break;
				case "class java.sql.Timestamp":
					if(fields[i].get((Object)cb)!=null) {
						pstmt.setTimestamp(count, java.sql.Timestamp.valueOf(fields[i].get((Object)cb).toString()));
					}
					else {
						pstmt.setTimestamp(count,new Timestamp(System.currentTimeMillis()));
					}
            		count++;
					break;	
				default:
					break;
				}
	        	if(fields[i].get((Object)cb)!=null) {
	        		switch (fields[i].getType().toString()) {
					case "class java.lang.String":
						pstmt.setString(count,fields[i].get((Object)cb).toString());
	            		count++;
						break;
					case "int":
						pstmt.setInt(count,Integer.parseInt(fields[i].get((Object)cb).toString()));
	            		count++;
						break;
					case "Timestamp":
						pstmt.setTimestamp(count, java.sql.Timestamp.valueOf(fields[i].get((Object)cb).toString()));
	            		count++;
						break;	
					default:
						break;
					}
	        	}
	         }*/
	         System.out.println(pstmt);
			//4단계 : sql 구분 실행 (insert, update, delete)
			//result = pstmt.executeUpdate();
		
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		finally {
			
		}
		return result;
	}
	
	private List ArrayList() {
		// TODO Auto-generated method stub
		return null;
	}

	//게시판 번호 가져 오기
	public int boardCount() {
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
				CodeBean bb = new CodeBean();
				
				//한사람의 객체생성한 기억장소에 저장
			/*	bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcont(rs.getInt("readcont"));
				bb.setReg_date(rs.getDate("reg_date"));*/
				
				// 정보를 배열 한칸에 저장
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {}
		
		return boardList; 
		
	}
	// 게시판 내용 가져 오기
	public CodeBean getBoard(CodeBean bb) {
		//ResultSet rs = null;
		try {
			
			
			/*//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = " select * from board where num = ?"; //Statement 형태
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum()); //첫째물음표, 값
			
			//4단계 : sql 구분 실행 (insert, update, delete)
			//결과 저장 <= sql 구문 실행 select 변수 = pstmt.executeQuery();
			rs = pstmt.executeQuery();
			bb = new CodeBean();
			
			if(rs.next()) {
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcont(rs.getInt("readcont"));
				bb.setReg_date(rs.getDate("reg_date"));
			}*/
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		finally {
			
			
		}
		
		return bb; 
	}
	//게시판 조회수 업데이트
	public void updateReadcont(CodeBean bb) {
		try {
			/*//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = "update board set readcont = readcont+1 where num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getNum()); //첫번째 물음표 값
			
			//4단계 : sql 구분 실행 (insert, update, delete)
			pstmt.executeUpdate();*/
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {}
	}
	
	//게시판 비밀번호 맞는지 확인
	public int boardCheckPass(CodeBean bb) {
		int result = 0;
		try {
			/*//DB연결 4단계
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
			}*/
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	//게시판 업데이트
	public int updateBoard(CodeBean bb) {
		int result = 0;
		try {
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = "update board set subject = ? ,content = ?, name= ?  where num=?";
			pstmt = con.prepareStatement(sql);
			
			/*pstmt.setString(1, bb.getSubject()); //첫번째 물음표 값
			pstmt.setString(2, bb.getContent()); //첫번째 물음표 값
			pstmt.setString(3, bb.getName()); //첫번째 물음표 값
			pstmt.setInt(4, bb.getNum()); //첫번째 물음표 값
*/			
			//4단계 : sql 구분 실행 (insert, update, delete)
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {}
		return result;
	}
	// 게시판 삭제
	public int deleteBoard(CodeBean bb) {
		int result = 0;
		try {
			//DB연결 4단계
			con  =   dbConnertion.dbConn();
			String sql = "delete from board where num=? and pass = ?";
			pstmt = con.prepareStatement(sql);
			/*pstmt.setInt(1, bb.getNum()); //첫번째 물음표 값
			pstmt.setString(2, bb.getPass()); //첫번째 물음표 값
*/			//4단계 : sql 구분 실행 (insert, update, delete)
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {}
		return result;
	}
	
	
			
}






























