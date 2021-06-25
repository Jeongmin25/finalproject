

package job.data.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {
	public int getTotalCount();
	public List<NoticeDto> getAllDatas();
	

}
