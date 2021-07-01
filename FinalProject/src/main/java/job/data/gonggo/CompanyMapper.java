package job.data.gonggo;

import java.util.List;

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
}


