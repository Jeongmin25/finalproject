package job.data.profile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import job.data.resume.CarerDto;
import job.data.resume.EducationDto;
import job.data.resume.ResumeDto;
import job.data.resume.ResumeMapper;
import job.data.userlogin.UserAccountDto;
import job.data.userlogin.UserAccountMapper;
import job.data.userlogin.auth.PrincipalDetails;

@Controller
public class ProfileController {
	
	@Autowired
	ResumeMapper rmapper;
	@Autowired
	UserAccountMapper umapper;
	@Autowired
	JobGroupMapper jmapper;
	
	@Autowired
	private MailService mailService;
	 
	@Autowired
	BCryptPasswordEncoder encodePwd;
	 
	@GetMapping("/profile")
	public ModelAndView profile_index(
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth,
			String num_r) {
		
				ModelAndView mv=new ModelAndView();
				PrincipalDetails principalDetails = (PrincipalDetails)
				authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
				
				 //전문 분야 설정
				int id=(int)userDetails.getUser().getId();
				int cnt= jmapper.searchIdOfJobGroup(id);
				
				 JobGroupDto gdto=jmapper.getDataOfJobGroup(id);
				 mv.addObject("gdto",gdto);
				 
				
				String user_id=Long.toString(userDetails.getUser().getId());
				//목록 가져오기
				List<ResumeDto> list=rmapper.getDataOfResume(user_id);
				mv.addObject("list",list);
				
				//만약 이력서가 존재하지 않는다면 type을 no를 보낸다
				if(list.size()==0) {
					mv.addObject("type","no");
				}else if(list.size()>0){
					if(num_r==null)//이력서는 존재하는데, num_r값이 전달되지 않았을 때
						num_r=Integer.toString(list.get(0).getNum_r()); 
					
					mv.addObject("num_r",num_r); 
					//num_r에 해당하는 정보 가져오기
					 ResumeDto rdto= rmapper.getResumeOneData(num_r);
					   
					 //각각의 값 꺼내기
					 EducationDto edto=rdto.getEducation().get(0);
					 CarerDto cdto=rdto.getCarer().get(0);
					   
					 mv.addObject("edto",edto);
					 mv.addObject("cdto",cdto);
					 mv.addObject("rdto",rdto);
				}
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
	
	@GetMapping("/deleteuser")
	public ModelAndView deleteuser(
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails,
			@AuthenticationPrincipal OAuth2User oauth
			) {
		ModelAndView mv=new ModelAndView();
		PrincipalDetails principalDetails = (PrincipalDetails)
		authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
		String id=Long.toString(userDetails.getUser().getId());
		umapper.deleteUserAccount(id);
		
		mv.setViewName("layout");
		return mv;
	}
	


    @PostMapping("/send")
    public String sendTestMail(@ModelAttribute MailDto mailDto) {
    	mailService.mailSend(mailDto);
    	return "layout";
    }
    
    @GetMapping("/mail")
    public String mail() {
    	return "/profile/mail";
    }
    
    @GetMapping("/change_password")
    public String changePassword() {
    	return "/profile/changePassword";
    }
        
    @PostMapping("/changePwAct")
    public String changePwAct(
    		@RequestParam String pass,
    		Authentication authentication,
 			@AuthenticationPrincipal PrincipalDetails userDetails,
 			@AuthenticationPrincipal OAuth2User oauth
    		) {

		 PrincipalDetails principalDetails = (PrincipalDetails)
		 authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
		 String user_id=Long.toString(userDetails.getUser().getId());
		 String password= encodePwd.encode(pass);
		 Map<String, String>map=new HashMap<String, String>();
		 System.out.println(password);
		 map.put("user_id", user_id);
		 map.put("password", password);
		 umapper.updatePasswordOfuser(map);
    	return "redirect:layout";
    }
    
    @PostMapping("/updateUser")
    public ModelAndView updateUser(@ModelAttribute UserAccountDto dto) {
    	ModelAndView mv=new ModelAndView();
    	umapper.updateUser(dto);
    	mv.setViewName("redirect:profile");
    	return mv;
    }
    
    @GetMapping("/bookmark")
    public String bookmark() {
    	return "/bookmark/bookmark";
    }
    
    @GetMapping("/jobGroup")
	   public ModelAndView jobGroup(String match) {
		   ModelAndView mv = new ModelAndView();
		   String jobGroup[]= {"IT/인터넷", "경영/기획/컨설팅", "디자인", "미디어/홍보/마케팅", "생산/제조", "유통/무역","서비스/고객지원"};
		   String it[]= {"웹개발자", "프론트엔드개발자", "Node.js개발자", "빅데이터엔지니어"};
		   String business[]= {"사업개발기획자", "컨설턴트", "경영지원"};
		   String design[]= {"그래픽디자이너", "웹디자이너", "일러스트레이터", "UI디자이너"};
		   String marketing[]= {"광고기획자", "마케팅전략기획자", "키워드광고", "소셜마케터"};
		   String production[]= {"생산직종사자", "제조엔지니어", "품질관리자", "반도체/디스플레이"};
		   String trade[]= {"수출입사무", "유통관리자", "배송담당", "항공운송"};
		   String service[]= {"MD", "CS어드바이저", "CS매니저", "텔레마케터"};
		   
		   if(match==null) {
			   mv.addObject("selectJob",it);
			   match="IT/인터넷";
		   } else if(match.equals("IT/인터넷"))
			   mv.addObject("selectJob",it);
		   else if(match.equals("디자인"))
			   mv.addObject("selectJob",design);
		   else if(match.equals("경영/기획/컨설팅"))
			   mv.addObject("selectJob",business);
		   else if(match.equals("미디어/홍보/마케팅"))
			   mv.addObject("selectJob",marketing);
		   else if(match.equals("생산/제조"))
			   mv.addObject("selectJob",production);
		   else if(match.equals("유통/무역"))
			   mv.addObject("selectJob",trade);
		   else if(match.equals("서비스/고객지원"))
			   mv.addObject("selectJob",service);
		   
		   mv.addObject("match",match);
		   mv.addObject("jobGroup",jobGroup);
		   mv.setViewName("/profile/jobGroup");
		   return mv;
	   }
    
    @PostMapping("/insertJobGroup")
    public ModelAndView insertJobGroup(@ModelAttribute JobGroupDto dto) {
    	ModelAndView mv=new ModelAndView();
    	//처음 입력하는 것인지 알아보기(1이면 입력한 경우, 0이면 처음 입력하는 경우)
    	int cnt= jmapper.searchIdOfJobGroup(dto.getId());
    	
    	if(cnt==0)//처음 입력하는 것일 경우 insert를 진행
    		jmapper.insertJobOfJobGroup(dto);
    	else if(cnt==1)//이미 입력을 한경우는 update를 진행
    		jmapper.updateJobOfJobGroup(dto);
    	
    	
    	mv.setViewName("redirect:profile");
    	return mv;
    }
}
