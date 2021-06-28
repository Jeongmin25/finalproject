package job.data.login;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Alias("user")
public class UserAccountDto {
	private long id;
	private String username;
	private String hp;
	private String password; 
	private String email;
	private String role; //ROLE_USER, ROLE_ADMIN
	private String provider;
	private String providerId;
	private Timestamp createDate;
	


}
