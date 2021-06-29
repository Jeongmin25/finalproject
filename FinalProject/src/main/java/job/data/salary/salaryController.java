package job.data.salary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class salaryController {

	@Autowired
	SalaryMapper mapper; 
	
	@GetMapping("/salary")
	   public ModelAndView review() {
	      ModelAndView mview =new ModelAndView();
	      
	     
	      mview.setViewName("/salary/salarylist");
	      return mview;
	   }
	
	@PostMapping("searchjob")
	public ModelAndView searchjob(
			@RequestParam String job,
			@RequestParam String jobgroup,
			@RequestParam String career
			) {
	  ModelAndView mview =new ModelAndView();
	      System.out.println("job:"+job);
	      System.out.println("jobgroup:"+jobgroup);
	      System.out.println("career:"+career);
	      
	      List<salaryDto> list=mapper.SearchJob(job, jobgroup);
	      mview.addObject("list", list);
	      
		     
	  mview.setViewName("/salary/salarylist");
	  return mview;	
	}
	
}
