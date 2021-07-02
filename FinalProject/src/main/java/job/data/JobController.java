package job.data;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import job.data.userlogin.auth.PrincipalDetails;

@Controller
public class JobController {
	@GetMapping("/")
	public ModelAndView home(Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth)
	{
		ModelAndView mv =new ModelAndView();
		//로그인할 시 정보를 전달
		if(authentication!=null) {
		
		  PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal(); 
		  OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
		  System.out.println(userDetails.getUser());
		  mv.addObject("auth",userDetails.getUsername());
		}
		  mv.setViewName("layout");
		return mv;
	}
		
}

