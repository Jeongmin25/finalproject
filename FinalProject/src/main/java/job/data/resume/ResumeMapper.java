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
	public void delresume(String num_r);
	public ResumeDto getResumeOneData(String num_r);
	//update
	public void updateResume(ResumeDto rdto);
	public void updateAward(AwardDto adto);
	public void updateCarer(CarerDto cdto);
	public void updateEducation(EducationDto edto);
	public void updateFore(ForeDto fdto);
	
	
}
