package job.data.resume;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class JobResumeController {
	 @Autowired
	  ResumeMapper mapper;
	 
	 @Autowired
	 SqlSession sqlSession;
	 
	 @GetMapping("/resumelist")
	 public ModelAndView resumelist() {
		 ModelAndView mview = new ModelAndView();
		 mview.setViewName("index.jsp?go=resume/resumelist");
		 //목록 가져오기
		 List<ResumeDto> list=mapper.getDataOfResume();
		 mview.addObject("list",list);
		 return mview;
	 }
	 
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
		   

			return "redirect:index?go=resume/addresume";
		}
	   
	   @GetMapping("/delresume")
	   public String delresume(String num_r) {
		   mapper.delresume(num_r);
		   return "redirect:index?go=resume/resumelist";
	   }
	   
	   //num_r에 해당하는 데이터 반환
	   @GetMapping("/resumedetail")
	   public ModelAndView getResumeOneData(String num_r) {
		   ModelAndView mview =new ModelAndView();
		   ResumeDto dto=new ResumeDto();
		   //resume 데이터를 받아온다
		   dto= mapper.getResumeOneData(num_r);
		   mview.addObject("dto", dto);
		   
		   //resumeDto에 멤버변수로 선언된 dto들을 list로 반환해서 값을 보낸다
		   List<CarerDto>cdto=dto.getCarer();
		   List<AwardDto>adto=dto.getAward();
		   List<EducationDto>edto=dto.getEducation();
		   List<ForeDto>fdto=dto.getFore();
		   
		   mview.addObject("cdto",cdto);
		   mview.addObject("adto",adto);
		   mview.addObject("edto",edto);
		   mview.addObject("fdto",fdto);
		   mview.addObject("num_r",dto.getNum_r());
		   
		  
		   
		   mview.setViewName("index.jsp?go=resume/resumedetail");
		   return mview;
	   }
		   
}
