package job.data.notice;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Alias("notice")
@Data

public class NoticeDto {
	
	private String num_n;
	private String writer;
	private String subject;
	private String content;
	private String photo;
	private MultipartFile upload;
	private int viewcount;
	private Timestamp writeday;

}
