package job.data.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import job.data.userlogin.auth.PrincipalDetails;

@Controller
public class FaqController {
	@Autowired
	FaqMapper mapper;
	
	@GetMapping("/Faq")
	public ModelAndView faqlist( Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth)
	
	{
		ModelAndView mview = new ModelAndView();
		
		 //로그인이 안되있을 시 그냥 이동
		 if(authentication==null) {
			List<FaqDto> dto=mapper.getFaqData();	
			mview.addObject("dto",dto);
			mview.setViewName("/faq/faqlist");
			return mview;		
		 }else { //로그인 되어있을 때
			 PrincipalDetails principalDetails = (PrincipalDetails)
			  authentication.getPrincipal(); 
			  OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
			  String user_id=Long.toString(userDetails.getUser().getId());
			  mview.addObject("auth",userDetails.getUsername());
			  
			  List<FaqDto> dto=mapper.getFaqData();	
			mview.addObject("dto",dto);
			mview.setViewName("/faq/faqlist");
			return mview;		
		 }
		
	}
	
	@GetMapping("/faqcontent")
	public ModelAndView faqmain(String num) {
		ModelAndView mview = new ModelAndView();
		FaqDto dto = new FaqDto();
		dto=mapper.getFaqContent(num);
		
		mview.addObject("dto",dto);
		mview.setViewName("/faq/faqcontent");
		return mview;
	}
	
	@GetMapping("/faqsearch")
	public ModelAndView faqsearch(@RequestParam String content) {
		ModelAndView mview = new ModelAndView();
		
		List<FaqDto> faqsearch=mapper.getSearchFaq(content);
		mview.addObject("content",content);
		mview.addObject("faqsearch",faqsearch);
		mview.setViewName("/faq/faqsearch");
		return mview;
	}
}
