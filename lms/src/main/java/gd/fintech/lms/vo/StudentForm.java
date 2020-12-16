package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class StudentForm {
	private String studentId; 
	private String studentPw;
	private String studentEmail;
	private String studentPhone;
	private String studentName;
	private String studentGender;
	private String studentBirth;
	private String studentPosition;
	private String studentAddressMain;
	private String studentAddressSub;
    private String accountState;
    private int accountLevel;
}
