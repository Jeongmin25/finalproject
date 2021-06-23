package job.data.resume;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("resume")
@Data
public class ResumeDto {
	private int num_r;
	private String intro;
	private String skill;
	private String link;
}
