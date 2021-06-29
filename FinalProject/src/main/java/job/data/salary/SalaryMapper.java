package job.data.salary;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalaryMapper {

	//직군, 직무 검색시 연차별 연봉 출력
	public List<salaryDto> SearchJob(String job, String jobgroup);


}
