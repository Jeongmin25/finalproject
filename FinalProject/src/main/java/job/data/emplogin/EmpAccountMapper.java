package job.data.emplogin;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpAccountMapper {

	public int getTotalCountOfEmp();
	public int emailCheckOfEmp(String email);
	public void insertEmpAccount(EmpAccountDto dto);
	
	//@Select("SELECT * FROM user_account WHERE username = #{username}")
	public EmpAccountDto findByEmpname(String Empname);


}
