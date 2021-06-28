package job.data.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


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
	      mview.setViewName("review/addreview");
	      return mview;
	   }
	
	@GetMapping("/review")
	public ModelAndView addreview(
			@RequestParam(value = "pageNum",defaultValue = "1") int currentPage
			) {
		ModelAndView mview =new ModelAndView();
		
		int totalCount=mapper.selectEmpnameCount();
		
		//페이징에 필요한 코드
		int totalPage;//전체 페이지
		int startPage;//각 블럭의 시작페이지
		int endPage;//각 블럭의 마지막페이지
		int start;//각 페이지의 시작번호
		int no;//각 페이지에서 출력을 시작할 번호
		int perPage=5;//한페이지에 보여질 글의 개수
		int perBlock=5;//한 블럭에 보여질 페이지의 개수

		//총 페이지수 구하기
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0); 
		//나머지가 있으면 1페이지 더하기(글개수13개면 페이지3장필요)

		//현재페이지가 3인경우 startPage는 1, endPage=5 / 현재페이지가 6인경우 startPage는 6, endPage=10
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;

		//만약 총 페이지수가 8인경우 2번째 블럭은 startPage 6, endPage 10 BUT, 이때 endPage는 8로 표기되어야한다.
		if(totalPage<endPage)
			endPage=totalPage;

		//각 페이지의 시작번호 구하기(1일경우 0, 2일경우 3)
		//오라클 첫글:1, mysql 첫글:0
		start=(currentPage-1)*perPage;

		//각 글 앞에 붙일 시작번호구하기 
		//예: 총글이 20개일경우 1페이지는 20부터 2페이지는 15부터 출력해서 1씩 감소해가며 출력할것
		no=totalCount-(currentPage-1)*perPage;		
		
		List<reviewDto> empname=mapper.selectEmpname(start, perPage);
		List<reviewDto> list=mapper.getReviewData();
		mview.addObject("empname",empname);
		mview.addObject("list",list);

		//출력에 필요한 변수들 모두 request에 저장(list.jsp에서 사용)
		mview.addObject("no", no);
		mview.addObject("startPage", startPage);
		mview.addObject("endPage", endPage);
		mview.addObject("currentPage", currentPage);
		mview.addObject("totalPage", totalPage);
		 
		mview.setViewName("review/reviewlist");
		return mview;
	}
	
	@PostMapping("/add")
	public String add(
			@ModelAttribute reviewDto rdto

			) {
		mapper.insertReview(rdto);
		return "review/addreview";
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
		mview.setViewName("review/reviewdetail");
		return mview;
	}
	
	@GetMapping("/insertlikes")
	public ModelAndView likes(@RequestParam int num) {
		ModelAndView mview =new ModelAndView();
		
		System.out.println("num:"+num);
		//조회수 증가 insert
		mapper.insertlikes(num);
		
		//num에 해당하는 데이터, 좋아요 수 출력
		List<reviewDto> dataOfnumLikes=mapper.dataOfnumLikes(num);
		mview.addObject("dataOfnumLikes",dataOfnumLikes);
		mview.setViewName("review/reviewdetail");
		return mview;
	}
	
	
	@GetMapping("/searchlist")
	public String searchlist (@RequestParam String word, Model model) {
		
		System.out.println("word:"+word);
		
		//기업 단어 검색
		List<reviewDto> searchlist=mapper.searchEmpname(word);
		
		//값 저장
		model.addAttribute("searchlist", searchlist);
		
		return "redirect:review/searchlist";
	}
}
