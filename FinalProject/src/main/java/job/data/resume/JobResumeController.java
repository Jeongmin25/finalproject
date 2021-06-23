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
				@ModelAttribute CarerDto carer,
				@ModelAttribute EducationDto education,
				@ModelAttribute ForeDto fore

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
		   
		 //education 학교명, 전공, 날짜를 ,를 기준으로 나눠받아 입력
		   education.setNum_r(num_r);
		   String school[]=education.getSchool().split(",");
		   String major[]=education.getMajor().split(",");
		   String e_start[]=education.getE_startday().split(",");
		   String e_end[]=education.getE_endday().split(",");
		   
		   for(int i=0;i<school.length;i++) {
			   education.setE_endday(e_end[i]);
			   education.setE_startday(e_start[i]);
			   education.setSchool(school[i]);
			   education.setMajor(major[i]);
			   mapper.insertEducation(education);
		   }
		   
		 //fore 언어, 레벨를 ,를 기준으로 나눠받아 입력
		   fore.setNum_r(num_r);
		   String lang[]=fore.getLang().split(",");
		   String level[]=fore.getLevel().split(",");
		   
		   for(int i=0;i<school.length;i++) {
			   fore.setLang(lang[i]);
			   fore.setLevel(level[i]);
			   mapper.insertFore(fore);
		   }
		   

			return "index";
		}
}
