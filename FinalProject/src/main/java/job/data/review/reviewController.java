package job.data.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class reviewController {

	@Autowired
	reviewMapper mapper;
	
	@GetMapping("/addreview")
	   public ModelAndView review() {
	      ModelAndView mview =new ModelAndView();
	      
	      //총 개수
	      int totalCount=mapper.getTotalCount();
	      mview.addObject("totalCount",totalCount);
	      mview.setViewName("index.jsp?go=review/addreview");
	      return mview;
	   }
	
	@GetMapping("/review")
	public ModelAndView addreview() {
		ModelAndView mview =new ModelAndView();
		List<reviewDto> empname=mapper.selectEmpname();
		List<reviewDto> list=mapper.getReviewData();
		 mview.addObject("empname",empname);
		 mview.addObject("list",list);
		 mview.setViewName("index.jsp?go=review/reviewlist");
		 return mview;
	}
	
	@PostMapping("/add")
	public String add(
			@ModelAttribute reviewDto rdto

			) {
		mapper.insertReview(rdto);
		return "index.jsp?go=review/addreview";
	}
	
	@GetMapping("/reviewdetail")
	public ModelAndView reviewdetail(
			@RequestParam String empname) {
		ModelAndView mview =new ModelAndView();
		//기업이름
		String emp=empname;
		mview.addObject("empname",emp);
		
		//총 개수
		int review0fEmp=mapper.review0fEmp(empname);
		mview.addObject("review0fEmp",review0fEmp);
		
		//데이터 출력
		List<reviewDto> list=mapper.getReviewData();
		mview.addObject("list",list);
		
		//empname에 해당하는 데이터 출력
		List<reviewDto> empdata=mapper.getReviewDataOfEmp(empname);
		mview.addObject("empdata",empdata);
		
		//평가 평균
		float avgRating=mapper.avgRating(empname);
		float avgCul=mapper.avgCul(empname);
		float avgImp=mapper.avgImp(empname);
		float avgEnv=mapper.avgEnv(empname);
		float avgSal=mapper.avgSal(empname);
		float avgCeo=mapper.avgCeo(empname);
		mview.addObject("avgRating",avgRating);
		mview.addObject("avgCul",avgCul);
		mview.addObject("avgImp",avgImp);
		mview.addObject("avgEnv",avgEnv);
		mview.addObject("avgSal",avgSal);
		mview.addObject("avgCeo",avgCeo);
		mview.setViewName("index.jsp?go=review/reviewdetail");
		return mview;
	}
	
	@GetMapping("/insertlikes")
	public ModelAndView likes(@RequestParam int num) {
		ModelAndView mview =new ModelAndView();
		//num값 저장
		int number=num;
		mview.addObject("number",num);
		
		//조회수 증가 insert
		mapper.insertlikes(number);
		
		//num에 해당하는 데이터, 좋아요 수 출력
		List<reviewDto> dataOfnumLikes=mapper.dataOfnumLikes(number);
		mview.addObject("dataOfnumLikes",dataOfnumLikes);
		mview.setViewName("index.jsp?go=review/reviewdetail");
		return mview;
	}
}
