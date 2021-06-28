package job.data;

import java.sql.Time;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("company")
public class CompanyDto {
	private int num;
	private String empname;
	private String empsubject;
	private String empcontent;
	private String empimg;
	private Timestamp deadline;
	private Timestamp writeday;
	
}
