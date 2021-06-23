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
				@ModelAttribute ResumeDto resume

				) {
			//resume 정보 삽입
			
		  System.out.println(resume.getSkill());
		  System.out.println(resume.getLink());
			
			//|를 기준으로 컬럼에 담기
			
			//담은 것 다시 dto에 담아주기
			
			//insert하기
		
		   mapper.insertResume(resume);
		  
			
			return "index";
		}
}
