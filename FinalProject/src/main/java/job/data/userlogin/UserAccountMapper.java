package job.data.userlogin;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserAccountMapper {

	public int getTotalCountOfUserAccount();
	public void insertUserAccount(UserAccountDto dto);
	
	//@Select("SELECT * FROM user_account WHERE username = #{username}")
	public UserAccountDto findByUsername(String username);
	
//	public int loginCheckOfUserAccount(String email, String pass);
//	
//	public UserAccountDto getUser(String id);
//	
//	public int passCheck(String id,String pass);
//	
//	public void updateOfUserAccount(UserAccountDto dto);
//	
//	public void deleteUserAccount(String id);

}
