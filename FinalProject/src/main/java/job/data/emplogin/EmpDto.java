package job.data.emplogin;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("emp_account")
public class EmpDto {
	private long num;
	private String empname;
	private String empserial;
	private String contry;
	private String postcode; 
	private String addr;
	private String detailaddr;
	private String extraaddr ;
	private String hp ;
	private String password;
	private String biztype ;
	private String staffnum ; 
	private String establishyear;
	private String email ;
	private String keyword  ;
	private Timestamp createDate;
	
}
