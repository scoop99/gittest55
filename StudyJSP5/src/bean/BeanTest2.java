package bean;

public class BeanTest2 {
	// 자바빈
	// 폼에 입력한 내용을 가져와서 저장, 필요(디피파일)에 전달 입력, 수정, 삭제
	// 디비에서 가져온데이터 저장, 화면에 전달해서 출력
	
	//맴버변수
	private String id;
	private int num;
	//생성자
	//메서드(멤버함수)
	// alt + shift s -> r
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}



}
