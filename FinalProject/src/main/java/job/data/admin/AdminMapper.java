package job.data.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
	
	public int loginCheck(String id,String pass);
	public int PassCheck(String id,String pass);
	
}
