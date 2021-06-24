package job.data.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface reviewMapper {

	public int getTotalCount();
	
	//review테이블 데이터 추가
	public void insertReview(reviewDto dto);
	
	//review테이블 테이터 출력
	public List<reviewDto> getReviewData();
	
	//review테이블 데이터 출력
	public List<reviewDto> getReviewDataOfNum(String num, String empname);
	
	//review기업명 조회
	public List<reviewDto> selectEmpname();
	
	//기업평가 평균
	public float avgRating(String empname);

	//사내문화 평균
	public float avgCul(String empname);

	//자기개발 평균
	public float avgImp(String empname);

	//근무환경 평균
	public float avgEnv(String empname);

	//급여 및 복지 평균
	public float avgSal(String empname);

	//경영진 평균
	public float avgCeo(String empname);
	
	//기업명 별 리뷰개수
	public int review0fEmp(String empname);
}
