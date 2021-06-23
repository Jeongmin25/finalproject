package job.data.resume;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JobResumeController {
	 @Autowired
	  ResumeMapper mapper;
	 
	 @GetMapping({"/addresume"})
	   public ModelAndView index() {
	      ModelAndView mview =new ModelAndView();
	     
	      mview.setViewName("index.jsp?go=resume/addresume");
	      return mview;
	   }
	   
	   @PostMapping("/insertresume")
		public String insertresume(
				@ModelAttribute ResumeDto resume,
				@ModelAttribute AwardDto award,
				@ModelAttribute CarerDto carer

				) {
		   //resume insert하고, num_r값 가져오기
		   mapper.insertResume(resume);
		   int num_r= mapper.getInsertNum();
		   
		   
		   //award 활동명, 세부사항, 날짜 ,를 기준으로 나눠서 받아 입력
		   award.setNum_r(num_r);
		   
			   String act[]=award.getActivity().split(",");
			   String detail[]=award.getDetail().split(",");
			   String start[]=award.getA_startday().split(",");
			   String end[]=award.getA_endday().split(",");
		
			   for(int i=0;i<act.length;i++) {
				   award.setA_endday(end[i]);
				   award.setActivity(start[i]);
				   award.setActivity(act[i]);
				   award.setDetail(detail[i]);
				   mapper.insertAward(award);
			   }
		   
			   
		   if(carer!=null) {
			   //carer 회사명, 부서, 날짜를 ,를 기준으로 나눠받아 입력
			   carer.setNum_r(num_r);
			   String company[]=carer.getCompany().split(",");
			   String depart[]=carer.getDepartment().split(",");
			   String c_start[]=carer.getC_startday().split(",");
			   String c_end[]=carer.getC_endday().split(",");
			   
			   for(int i=0;i<company.length;i++) {
				   carer.setC_endday(c_end[i]);
				   carer.setC_startday(c_start[i]);
				   carer.setCompany(company[i]);
				   carer.setDepartment(depart[i]);
				   mapper.insertCarer(carer);
			   }
		   }
		   

			return "index";
		}
}
