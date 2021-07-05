package job.data.recommend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import job.data.profile.JobGroupDto;
import job.data.profile.JobGroupMapper;
import job.data.userlogin.UserAccountDto;
import job.data.userlogin.UserAccountMapper;
import job.data.userlogin.auth.PrincipalDetails;

@Controller
public class recommendController {
	
	@Autowired
	UserAccountMapper usermapper;
	
	@Autowired
	JobGroupMapper jobmapper;
	
	@Autowired
	recommendMapper mapper;
	
	@GetMapping("/recommend")
	public ModelAndView recommend(
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth
			) {
		ModelAndView mview =new ModelAndView();
		
		//로그인할 시 정보를 전달
		if(authentication!=null) {
		
		  PrincipalDetails principalDetails = (PrincipalDetails)
		  authentication.getPrincipal(); OAuth2User oauth2User =
		  (OAuth2User)authentication.getPrincipal();
		  mview.addObject("auth",userDetails.getUsername());
		}
		
		//로그인된 username 얻기
		String username=(String)userDetails.getUsername();
		
		//로그인된 username의 num값 얻기
		UserAccountDto user=usermapper.findByUsername(username);
		int id=(int)user.getId();
		
		//로그인된 username의 num값으로 직군 얻기
		JobGroupDto usernamejob=jobmapper.getDataOfJobGroup(id);
		String job=usernamejob.getJob_group();		
		
		
		System.out.println("username:"+username);
		System.out.println("usernamejob:"+usernamejob);
		System.out.println("job:"+job);

		
		//직군으로 공고 데이터 얻기
		List<recommendDto> data=mapper.recommendData(job);
		System.out.println("data="+data);
		
		mview.addObject("data", data);
		mview.addObject("username", username);
		mview.addObject("usernamejob", usernamejob);
		
		mview.setViewName("/recommendation/recommendlist");
		return mview;
}
}
