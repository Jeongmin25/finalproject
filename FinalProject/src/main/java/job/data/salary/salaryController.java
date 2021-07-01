package job.data.salary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class salaryController {

	@Autowired
	SalaryMapper mapper; 
	
	@GetMapping("/salary")
	   public ModelAndView review() {
	      ModelAndView mview =new ModelAndView();
	     
	      //salary 초기값 
	      List<salaryDto> saldefault=mapper.salarydefault();
	      mview.addObject("saldefault", saldefault);
	    
	      mview.setViewName("/salary/salarylist");
	      return mview;
	   }
	
	
	@ResponseBody
	@PostMapping("searchjob")
	public List<salaryDto> searchjob(
			@RequestParam String job,
			@RequestParam String jobgroup,
			@RequestParam String career
			) {
	 
	      System.out.println("job:"+job);
	      System.out.println("jobgroup:"+jobgroup);
	      System.out.println("career:"+career);
	      
	      List<salaryDto> list=mapper.SearchJob(job, jobgroup);
	      
	  return list;
	}
	
	@ResponseBody
	@PostMapping("searchsal")
	public int searchsal(
			@RequestParam String job,
			@RequestParam String jobgroup,
			@RequestParam String career
			) {
	 
	      System.out.println("job:"+job);
	      System.out.println("jobgroup:"+jobgroup);
	      System.out.println("career:"+career);
	      
	      int sal=mapper.SearchSal(job, jobgroup, career);
	      
	  return sal;
	}
	
}
