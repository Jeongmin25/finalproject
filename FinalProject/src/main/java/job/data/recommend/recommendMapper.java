package job.data.recommend;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface recommendMapper {
	
	//추천공고
	public List<recommendDto> recommendData(String job);

}
