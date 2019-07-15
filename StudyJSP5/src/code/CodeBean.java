package code;


import java.sql.Timestamp;

public class CodeBean {
	private String codeDiv; // 코드구분
	private String code; // 코드
	private String codeName; // 한글코드명
	private String codeSmlName; // 한글코드약어명
	private String engName; // 영문명
	private String engSmlName; // 영문약어명
	private int orderSeq; // 정렬순서
	private int orderSeq1; // 정렬순서1
	private String useMethod1; // 용도구분1
	private String useMethod2; // 용도구분2
	private String useMethod3; // 용도구분3
	private int codeStep; // 코드순서
	private String useYn; // 사용여부
	private String remark; // 비고
	private String domain; // 도메인
	private String regiId; // 등록자아이디
	private String regiIpAddr; // 등록자아이피
	private Timestamp regiDate; // 등록일자
	private String modifierId; // 수정자아이디
	private String modifierIp; // 수정자아이피
	private Timestamp modifierDate; // 수정일자
	
	public String getCodeDiv() {
		return codeDiv;
	}
	public void setCodeDiv(String codeDiv) {
		this.codeDiv = codeDiv;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeSmlName() {
		return codeSmlName;
	}
	public void setCodeSmlName(String codeSmlName) {
		this.codeSmlName = codeSmlName;
	}
	public String getEngName() {
		return engName;
	}
	public void setEngName(String engName) {
		this.engName = engName;
	}
	public String getEngSmlName() {
		return engSmlName;
	}
	public void setEngSmlName(String engSmlName) {
		this.engSmlName = engSmlName;
	}
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	public int getOrderSeq1() {
		return orderSeq1;
	}
	public void setOrderSeq1(int orderSeq1) {
		this.orderSeq1 = orderSeq1;
	}
	public String getUseMethod1() {
		return useMethod1;
	}
	public void setUseMethod1(String useMethod1) {
		this.useMethod1 = useMethod1;
	}
	public String getUseMethod2() {
		return useMethod2;
	}
	public void setUseMethod2(String useMethod2) {
		this.useMethod2 = useMethod2;
	}
	public String getUseMethod3() {
		return useMethod3;
	}
	public void setUseMethod3(String useMethod3) {
		this.useMethod3 = useMethod3;
	}
	public int getCodeStep() {
		return codeStep;
	}
	public void setCodeStep(int codeStep) {
		this.codeStep = codeStep;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getRegiId() {
		return regiId;
	}
	public void setRegiId(String regiId) {
		this.regiId = regiId;
	}
	public String getRegiIpAddr() {
		return regiIpAddr;
	}
	public void setRegiIpAddr(String regiIpAddr) {
		this.regiIpAddr = regiIpAddr;
	}
	public Timestamp getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Timestamp regiDate) {
		this.regiDate = regiDate;
	}
	public String getModifierId() {
		return modifierId;
	}
	public void setModifierId(String modifierId) {
		this.modifierId = modifierId;
	}
	public String getModifierIp() {
		return modifierIp;
	}
	public void setModifierIp(String modifierIp) {
		this.modifierIp = modifierIp;
	}
	public Timestamp getModifierDate() {
		return modifierDate;
	}
	public void setModifierDate(Timestamp modifierDate) {
		this.modifierDate = modifierDate;
	}
	
	

}
