package job.data.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeMapper {

	public int getTotalCount();
}
