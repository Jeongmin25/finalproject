package job.data.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
	
	public int loginCheckOfAdmin(String adminid,String adminpass);
	public int passCheckOfAdmin(String adminid,String adminpass);
	
}
