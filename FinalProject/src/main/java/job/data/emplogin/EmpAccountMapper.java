package job.data.emplogin;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpAccountMapper {

	public int getTotalCountOfEmp();
	public int emailCheckOfEmp(String email);
	public void insertOfEmp(EmpAccountDto dto);
	public int loginCheckOfEmp(String email,String password);
	
	//@Select("SELECT * FROM user_account WHERE username = #{username}")
	public EmpAccountDto findByEmpname(String Empname);


}
