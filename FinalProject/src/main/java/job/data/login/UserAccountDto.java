package job.data.login;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Data
@Table(name="userAccount")
public class UserAccountDto {
	@Id // primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String username;
	private String hp;
	private String password; 
	private String email;
	private String role; //ROLE_USER, ROLE_ADMIN
	@CreationTimestamp
	private Timestamp createDate;

}
