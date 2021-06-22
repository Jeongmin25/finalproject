package job.data.resume;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	     
	      mview.setViewName("resume/addresume");
	      return mview;
	   }
	   
		/*
		 * @PostMapping("searchskill") public ModelAndView searchskill(@RequestParam
		 * String keyword) { ModelAndView mview =new ModelAndView();
		 * mview.setViewName("resume/addresume"); return mview; }
		 */
}
