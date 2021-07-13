package job.data.pjlist;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import job.data.emplogin.EmpAccountMapper;
import job.data.gonggo.CompanyDto;
import job.data.gonggo.CompanyMapper;
import job.data.userlogin.auth.PrincipalDetails;


@Controller
public class Listcontroller {
	
	
	@Autowired
	CompanyMapper datamapper;
	
	@Autowired
	EmpAccountMapper empmapper;
	
	
	
	@GetMapping("/pjlist/list")
	public String list(){
		
		return "/pjlist/list";	
	}
	
	 @RequestMapping(value="/pjlist" , method = {RequestMethod.GET, RequestMethod.POST})
	 @PostMapping("/pjlist")
	   public ModelAndView pjlist(@ModelAttribute listCategotyDto dto,String num,
			   Authentication authentication,
				@AuthenticationPrincipal PrincipalDetails userDetails,
				@AuthenticationPrincipal OAuth2User oauth) 
	 {
		 
	    ModelAndView mview =new ModelAndView();
	
	    //로그인이 안되있을 시 그냥 이동
		 if(authentication==null) {
			
			   //목록 가져오기
			    List<CompanyDto> gonggolist=datamapper.getAlldatas(num);
			    CompanyDto cdto=new CompanyDto();
				cdto=datamapper.getData(num);
			    //System.out.println("getnum:"+num);
			    Date date=new Date();
		        long time= date.getTime();
		        //System.out.println(dto.getTag());
		        mview.addObject("num", num);
		        mview.addObject("date", date);
		        mview.addObject("time",time);
			    mview.addObject("gonggolist",gonggolist);
			      
			    for(CompanyDto d:gonggolist)
			      
			      mview.setViewName("/pjlist/list");
				
			  return mview;
		 }else {//로그인 되어있을 때
			 
		
		  PrincipalDetails principalDetails = (PrincipalDetails)
		  authentication.getPrincipal(); 
		  OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
		  String user_id=Long.toString(userDetails.getUser().getId());
		  mview.addObject("auth",userDetails.getUsername());
	    
	    //목록 가져오기
	    List<CompanyDto> gonggolist=datamapper.getAlldatas(num);
	    CompanyDto cdto=new CompanyDto();
		cdto=datamapper.getData(num);
	    //System.out.println("getnum:"+num);
	    Date date=new Date();
        long time= date.getTime();
        //System.out.println(dto.getTag());
        mview.addObject("num", num);
        mview.addObject("date", date);
        mview.addObject("time",time);
	    mview.addObject("gonggolist",gonggolist);
	      
	    for(CompanyDto d:gonggolist)
	      
	    mview.setViewName("/pjlist/list");
	    return mview;
	    
		 }
	   }
	 
//	 @ResponseBody
//		@GetMapping("/gonggo/premiumlist")
//		public String buypremium(@RequestParam String amount, @RequestParam String num, @ModelAttribute CompanyDto dto) {
//			String success;
//			datamapper.insertmoney(dto);
//			success = "성공";
//
//			return success;
//		}
		
	 @GetMapping({"/premiumlist"}) 
	  public ModelAndView success(HttpSession session) 
	  { 
		  ModelAndView mview =new ModelAndView(); 
		  String email=(String)session.getAttribute("myemail");
		  String empname=empmapper.searchEmpName(email); 
		  List<CompanyDto>gonggolist=datamapper.getmygonggo(empname);
		  return mview;
	  }
		 
	 
	 @ResponseBody
	 @PostMapping({"/pjlistsearchtag"})
	 public List<CompanyDto> searchListByTag(@RequestParam String tag){
		
		 //tag가 들어간 공고리스트 전체 출력
		 List<CompanyDto> listByTag=datamapper.searchListByTag(tag);
		 //System.out.println("list="+listByTag);
		 
		 return listByTag;
	 }
	 	
		
	  @ResponseBody
	  @PostMapping({"/pjlistsearchjob"}) 
	  public List<CompanyDto>searchByJob(@RequestParam String jobgroup)
	  
	  { 
		  //직무에 따른 공고리스트 출력
			//System.out.println(jobgroup);
			List<CompanyDto>listByJob=datamapper.searchByJob(jobgroup);
			//System.out.println("list="+listByJob);
		  
			return listByJob; 
	 
	 }
	  
	  @ResponseBody
	  @PostMapping({"/pjlistsearcharea"}) 
	  public List<CompanyDto>searchByArea(@RequestParam String addr)
	  
	  { 	
		  //지역에 따른 공고리스트 출력
			//System.out.println(addr);
		  	List<CompanyDto>listByArea=datamapper.searchByArea(addr);
		  	System.out.println("list="+listByArea);
		  	
		  	
		  	return listByArea; 
	 
	 }
	  
	  
	  
		 
	 
	 
	 
	 
	
}
