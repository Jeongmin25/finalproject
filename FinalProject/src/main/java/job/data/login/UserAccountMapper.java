package job.data.login;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserAccountMapper {

	public int getTotalCountOfUserAccount();
	public void insertUserAccount(UserAccountDto dto);
	
	//@Select("SELECT * FROM user_account WHERE username = #{username}")
	public List<UserAccountDto> findByUsername(String username);
}
