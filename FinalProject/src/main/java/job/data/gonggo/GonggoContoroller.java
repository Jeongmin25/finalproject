package job.data.gonggo;



import java.io.File;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import job.data.JobMapper;
import job.data.resume.ResumeDto;
import job.data.resume.ResumeMapper;
import job.data.userlogin.auth.PrincipalDetails;




@Controller
public class GonggoContoroller {
	  @Autowired
	  	CompanyMapper mapper;
	  @Autowired
	  	ResumeMapper rmapper;
	  
		String uploadName;//photo 폴더에 업로드 되는 실제 사진 파일명

	   @GetMapping("/gonggolist")
	   public ModelAndView index() {
	      ModelAndView mview =new ModelAndView();
	      //목록 가져오기
	      List<CompanyDto> gonggolist=mapper.getAlldatas();
	      Date date=new Date();
          long time= date.getTime();
          
          mview.addObject("date", date);
          mview.addObject("time",time);
	      mview.addObject("gonggolist",gonggolist);
	      
	      for(CompanyDto d:gonggolist)
	    	  System.out.println(d.getDeadline());
	      
	      mview.setViewName("/gonggo/gonggolist");
	      return mview;
	   }
	   @GetMapping({"/gonggodetail"})
	   public ModelAndView gonggo(
			   Authentication authentication,
			  @AuthenticationPrincipal PrincipalDetails userDetails,
			  @AuthenticationPrincipal OAuth2User oauth,
			   @RequestParam String num,String book)
	   {
		   ModelAndView mview=new ModelAndView();
		   CompanyDto dto=mapper.getData(num);
			mview.addObject("dto",dto);
			
			 PrincipalDetails principalDetails = (PrincipalDetails)
			 authentication.getPrincipal(); OAuth2User oauth2User =(OAuth2User)authentication.getPrincipal();
			 String id=Long.toString(userDetails.getUser().getId());
			
			List<CategoryDto>category=dto.getCategory();
			mview.addObject("category",category);
			mview.addObject("num",dto.getNum());
			
		
			//이력서 목록 가져오기
			List<ResumeDto> list=rmapper.getDataOfResume(id);
			mview.addObject("list",list);
			
			//북마크 체크 여부
			Map<String, String>map=new HashMap<String, String>();
			map.put("id", id);
			map.put("num", num);
		
			if(book!=null) {//북마크 값이 넘어온 경우
				if(book.equals("yes")) {//북마크 값이 "yes"인 경우
					//insert
					mapper.insertBookmark(map);
					mview.addObject("book","yes");
				}else if(book.equals("no")) {//북마크 값이 "no"인 경우
					//delete
					mapper.deleteBookmark(map);
					mview.addObject("book","no");
				}
			}else if(book==null) {//북마트 값이 넘어오지 않은 경우
				int cnt = mapper.searchNum(map);
			
				if(cnt==0) {
					mview.addObject("book","no");
				}else if(cnt==1) {
					mview.addObject("book","yes");
				}
			}
			
			mview.setViewName("/gonggo/gonggodetail");
			return mview;
	   }
	   
	   @PostMapping("/detail")
	   public CompanyDto getData(String num)
	   {
		   return mapper.getData(num);
	   }

	   @PostMapping("/insert")
	   public String insertgonggo(
			   @ModelAttribute CompanyDto dto,
			   @ModelAttribute CategoryDto category,
			   HttpServletRequest request)
	   {
		   String path=request.getSession().getServletContext().getRealPath("/gonggophoto"); 
		   System.out.println(path); 
		   
		   SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		   String fileName="photo"+sdf.format(new Date())+"_"+dto.getUpload().getOriginalFilename();
		   //파일명= "photo"+날짜(년월일시분초)+dto에 업로드된 실제 파일이름
		   dto.setEmpimg(fileName);
		   MultipartFile uploadFile=dto.getUpload();
		   try { 
				 uploadFile.transferTo(new File(path+"\\"+fileName));
				} catch(IllegalStateException | IOException e) { 
					e.printStackTrace(); } 
		   //db insert 
			mapper.insertGonggo(dto);
			int num=mapper.getInsertNum();
			category.setNum(num);
			
			String ctg[]=category.getCtg().split(",",-1);
			//String ctg_idx[]=category.getCtg_idx().split(",",-1);
			String tag[]=category.getTag().split(",",-1);
			//String tag_idx[]=category.getTag_idx().split(",",-1);
			
			for(int i=0; i<ctg.length; i++) {
				category.setCtg(ctg[i]);
				//category.setCtg_idx(ctg_idx[i]);
				category.setTag(tag[i]);
				//category.setTag_idx(tag_idx[i]);
				mapper.insertCategory(category);
			}
			return "redirect:gonggolist"; 
	   }
		
	   @GetMapping({"/writegonggo"})
	   public ModelAndView insertform()
	   {
		   ModelAndView mview =new ModelAndView();
		      //외국어 select 태그 배열값 보내기
			   String lang [] = {"영어","중국어 북경어","중국어 광동어","일본어","한국어","독일어"
					   ,"스페인어","프랑스어","네덜란드어","노르웨이어","덴마크어"};
			   String level []= {"유창","비지니스회화","일상회화"};
			   mview.addObject("lang",lang);
			   mview.addObject("level",level);
		      
		      mview.setViewName("/gonggo/writegonggo");
		      return mview;
		   }
		   
	   
	   
	   @GetMapping("/delete")
	   public String delete(@RequestParam String num)
	   {
		   mapper.deleteGonggo(num);
		   mapper.deleteCategory(num);
		   return "redirect:gonggolist";
	   }
	   

	   @GetMapping({"/updategonggo"})
	   public ModelAndView updateform(@RequestParam String num)
	   {
		   ModelAndView mview=new ModelAndView();
		   CompanyDto dto=mapper.getData(num);
		   
		   List<CategoryDto>category=dto.getCategory();
		    mview.addObject("dto",dto);
			mview.addObject("category",category);
			mview.setViewName("/gonggo/updateform");
			return mview;
	   }
	   
	   @PostMapping("/update")
	   public ModelAndView update(@ModelAttribute CompanyDto dto,
			   @ModelAttribute CategoryDto category,
			   @RequestParam String num,
				HttpServletRequest request)
	   {
		   String path=request.getSession().getServletContext().getRealPath("/gonggophoto");
			System.out.println(path);
			String f=dto.getUpload().getOriginalFilename();
			//파일명 앞에 붙일 날짜 구하기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String fileName="photo"+sdf.format(new Date())+"_"+dto.getUpload().getOriginalFilename();
			if(f.equals("")){
				CompanyDto mto=mapper.getData(num);
				dto.setEmpimg(mto.getEmpimg());
				}else{
				//파일명= "photo"+ 날짜(년월일시분초)+dto에 업로드된 실제 파일이름
				//dto에 업로드될 파일명 저장
				dto.setEmpimg(fileName);
				//업로드 transferTo : 업로드한 파일 데이터를 지정한 파일에 저장
				MultipartFile uploadFile=dto.getUpload();
					try {
						uploadFile.transferTo(new File(path+"\\"+fileName));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
				}
				ModelAndView mview = new ModelAndView();
				mapper.updateGonggo(dto);
				int cnum=dto.getNum();
				category.setNum(cnum);
				String ctg[]=category.getCtg().split(",",-1);
				//String ctg_idx[]=category.getCtg_idx().split(",",-1);
				String tag[]=category.getTag().split(",",-1);
				//String tag_idx[]=category.getTag_idx().split(",",-1);
				
				mapper.deleteCategory(num);
				for(int i=0; i<ctg.length; i++) {
					category.setCtg(ctg[i]);
					//category.setCtg_idx(ctg_idx[i]);
					category.setTag(tag[i]);
					//category.setTag_idx(tag_idx[i]);
					mapper.insertCategory(category);
				}
			
			mview.addObject("num",num);
			mview.setViewName("redirect:gonggodetail?num="+num);
			return mview;

	   }
	   

}
