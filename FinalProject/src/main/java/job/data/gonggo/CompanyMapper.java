package job.data.gonggo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import job.data.CompanyDto;

@Mapper
public interface CompanyMapper {
	public int getTotalCount();
	public List<CompanyDto> getAlldatas();
	public CompanyDto getData(String num);
}


