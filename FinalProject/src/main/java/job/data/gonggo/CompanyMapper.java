package job.data.gonggo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CompanyMapper {
	public List<CompanyDto> getAlldatas();
	public CompanyDto getData(String num);
	
	public void insertGonggo(CompanyDto dto);
	public int getInsertNum();
	public void insertCategory(CategoryDto dto);
	
	public void deleteGonggo(String num);
	public void deleteCategory(String num);
	
	public void updateGonggo(CompanyDto dto);
	public void updateCategory(CategoryDto dto);
	
	//bookmark되어있는지 확인
	public int searchNum(Map<String, String>map);
	//bookmark값 삽입
	public void insertBookmark(Map<String, String>map);
	//bookmark 삭제
	public void deleteBookmark(Map<String, String>map);
}


