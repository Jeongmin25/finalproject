package job.data.profile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import job.data.resume.CarerDto;
import job.data.resume.EducationDto;
import job.data.resume.ResumeDto;
import job.data.resume.ResumeMapper;

@Controller
public class ProfileController {
	
	@Autowired
	ResumeMapper rmapper;
	
	@GetMapping("/profile")
	public ModelAndView profile_index(String num_r) {
		
		ModelAndView mv=new ModelAndView();
		 //목록 가져오기
		 List<ResumeDto> list=rmapper.getDataOfResume();
		 mv.addObject("list",list);
		 mv.addObject("num_r",num_r);
		 
		  //num_r에 해당하는 정보 가져오기
		   ResumeDto rdto= rmapper.getResumeOneData(num_r);
		   
		   //각각의 값 꺼내기
		  
		   EducationDto edto=rdto.getEducation().get(0);
		   CarerDto cdto=rdto.getCarer().get(0);
		   
		   mv.addObject("edto",edto);
		   mv.addObject("cdto",cdto);
		   mv.addObject("rdto",rdto);
		 
		mv.setViewName("/profile/profile");
		return mv;
	}
	
	@GetMapping("/personUpdateForm")
	public ModelAndView personUpdateForm() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/profile/personUpdateForm");
		return mv;
	}
	
	@GetMapping("/myjob")
	public ModelAndView myjob() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/profile/myjob");
		return mv;
	}
	
	@GetMapping("/acntMngmn")
	public ModelAndView acntMngmn(@RequestParam String type) {
		ModelAndView mv = new ModelAndView();
		if(type==null) {
			type="changePassword";
		}
		
		mv.addObject("type",type);
		mv.setViewName("/profile/acntMngmn");
		return mv;
	}
}
