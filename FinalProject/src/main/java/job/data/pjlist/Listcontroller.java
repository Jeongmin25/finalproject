package job.data.pjlist;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import job.data.emplogin.EmpAccountDto;
import job.data.emplogin.EmpAccountMapper;
import job.data.gonggo.CategoryDto;
import job.data.gonggo.CompanyDto;
import job.data.gonggo.CompanyMapper;


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
	   public ModelAndView pjlist(@ModelAttribute listCategotyDto dto) {
	    ModelAndView mview =new ModelAndView();
	    //목록 가져오기
	    List<CompanyDto> gonggolist=datamapper.getAlldatas();
	    Date date=new Date();
        long time= date.getTime();
        System.out.println(dto.getTag());
        mview.addObject("date", date);
        mview.addObject("time",time);
	    mview.addObject("gonggolist",gonggolist);
	      
	    for(CompanyDto d:gonggolist)
	      
	      mview.setViewName("/pjlist/list");
	      return mview;
	   }
	 
	
		/*
		 * //empname에 해당하는 데이터 출력 
		 * HashMap<String, Object> map = new HashMap<String,Object>(); 
		 * map.put("empname", empname); map.put("start", start);
		 * map.put("perpage", perPage);
		 * 
		 * List<reviewDto> empdata=mapper.getReviewDataOfEmp(map);
		 * mview.addObject("empdata",empdata);
		 */
	 
	 
	 @GetMapping({"pjlist/gonggodetail"})
	   public ModelAndView gonggo(String num)
	   {
		   ModelAndView mview=new ModelAndView();
		   	CompanyDto dto=new CompanyDto();
		    dto= datamapper.getData(num);
			mview.addObject("dto",dto);
									
			List<CategoryDto>cdto=dto.getCategory();
			mview.addObject("cdto",cdto);
			mview.addObject("num",dto.getNum());
	
			mview.setViewName("gonggo/gonggodetail");
			return mview;
	   }
	 
	 
	 @ResponseBody
	 @PostMapping({"/pjlistsearchtag"})
	 public List<CompanyDto> searchListByTag(@RequestParam String tag){
		
		 //tag가 들어간 공고리스트 전체 출력
		 List<CompanyDto> listByTag=datamapper.searchListByTag(tag);
		 System.out.println(listByTag);
		 
		 return listByTag;
	 }
	 
	 
		
	  @ResponseBody
	  
	  @PostMapping({"/pjlistsearchaddr"}) 
	  public List<EmpAccountDto>searchListByaddr(@RequestParam String area,@RequestParam String addr)
	  
	  { 
		  //area,addr이 들어간 공고리스트 전체 출력 
		  List<EmpAccountDto>listByAddr=empmapper.searchListByAddr(area,addr);
		  System.out.println(listByAddr);
	  
		  return listByAddr; 
	 }
	 
	 
	 
	 
	
}
