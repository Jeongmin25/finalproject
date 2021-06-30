package job.data.resume;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeMapper {

	public int getTotalCount();
	public void insertResume(ResumeDto rdto);
	public int getInsertNum();
	public void insertAward(AwardDto adto);
	public void insertCarer(CarerDto cdto);
	public void insertEducation(EducationDto edto);
	public void insertFore(ForeDto fdto);
	public List<ResumeDto> getDataOfResume();
	//user_id에 해당하는 이력서 데이터 가져오기
	public List<ResumeDto> getDataOfResume(String user_id);
	public void delresume(String num_r);
	public ResumeDto getResumeOneData(String num_r);

	//update
	public void updateResume(ResumeDto rdto);
	public void updateAward(AwardDto adto);
	public void updateCarer(CarerDto cdto);
	public void updateEducation(EducationDto edto);
	public void updateFore(ForeDto fdto);
	//delete
	public void delAward(String num_r);
	public void delEducation(String num_r);
	public void delFore(String num_r);
	public void delCarer(String num_r);
	
	
}
