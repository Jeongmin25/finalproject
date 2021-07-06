package job.data.emplogin;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface EmpAccountMapper {

	public int getTotalCountOfEmp();
	public int emailCheckOfEmp(String email);
	public void insertOfEmp(EmpAccountDto dto);
	public int loginCheckOfEmp(String email,String password);
	
	//@Select("SELECT * FROM user_account WHERE username = #{username}")
	public EmpAccountDto findByEmpname(String Empname);
	
	/* 관리자페이지에 출력 */
	public List<EmpAccountDto> getAllEmpAccount();
	
	public void deleteEmpAccount(String num);


}
