package kr.co.warebridge.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.co.warebridge.validate.constraints.TelNumber;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@ToString
@Data
@EqualsAndHashCode(of = "empNo")
public class EmployeeVO implements Serializable{
	private int rnum;
	@NotBlank
	private String empNo;
	@NotBlank
	private String empCmpId;
	@NotBlank
	private String empName;
	private String empPicpath; //DB메타데이터용
	private MultipartFile profileFile; //파일시스템에 저장될 실제 파일객체 = MultipartFile 형태로 클라이언트로부터 전송된 실제 파일
	public void setProfileFile(MultipartFile profileFile) {
		if(profileFile == null || profileFile.isEmpty()) {
			return;	//비어있는 파일을 걸러냄
		}
		empPicpath = UUID.randomUUID().toString();
		this.profileFile = profileFile;
	}
	public void setempRole(String empRoleString) {
		if (empRoleString != null && !empRoleString.isEmpty()) {
            String[] rolesArray = empRoleString.split(",");
            this.empRole = Arrays.asList(rolesArray);
        }
	}
	
	private String base64;
	
	private String empPass;
	private String empDptId1;
	private String empDptId2;
	private String empStatus;
	private List<String> empRole;
	@TelNumber
	private String empMobile;
	@TelNumber
	private String empHometelno;
	@TelNumber
	private String empCmptelno;
	private String empMail;
	private String empFax;
	private String empAddr;
	private String empWorkingplace;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate empBirthday;
	private String empRemarks;
	@JsonIgnore
	@ToString.Exclude
	private String empRrno;
	private String empJobduty;
	private String empJobank;
	private String empJobposition;
	private String empInterests;
	private String empGen;
	
	private DepartmentVO department;
}