package job.data.gonggo;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import job.data.CompanyDto;


@Controller
public class GonggoContoroller {
	  @Autowired
	  	CompanyMapper mapper;
		String uploadName;//photo 폴더에 업로드 되는 실제 사진 파일명
		
	   @GetMapping("/gonggolist")
	   public ModelAndView index() {
	      ModelAndView mview =new ModelAndView();
	      //총 개수
	      int totalCount=mapper.getTotalCount();
	      mview.addObject("totalCount",totalCount);
	      
	      
	      //목록 가져오기
	      List<CompanyDto> gonggolist=mapper.getAlldatas();
	      mview.addObject("gonggolist",gonggolist);
	      for(CompanyDto d:gonggolist)
	    	  System.out.println(d.getDeadline());
	      mview.setViewName("index.jsp?go=gonggo/gonggolist");
	      return mview;
	   }
	   @GetMapping({"/gonggodetail"})
	   public ModelAndView gonggo(@RequestParam String num)
	   {
		   ModelAndView mview=new ModelAndView();
		   CompanyDto dto=mapper.getData(num);
			mview.addObject("dto",dto);
			mview.setViewName("index.jsp?go=gonggo/gonggodetail");
			return mview;
	   }
	   
	   @PostMapping("/detail")
	   public CompanyDto getData(String num)
	   {
		   return mapper.getData(num);
	   }
	   
	   @PostMapping(value = "/gonggo/upload",consumes= {"multipart/form-data"})
		public Map<String, String> fileUpload(
				@RequestParam MultipartFile uploadFile, HttpServletRequest request)
		{
			String path=request.getSession().getServletContext().getRealPath("/gonggophoto");
			System.out.println(path);
			
			Date date=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			uploadName="d"+sdf.format(date)+"_"+uploadFile.getOriginalFilename();
			try {
				uploadFile.transferTo(new File(path+"\\"+uploadName));
			}catch(Exception e) {
				System.out.println("파일 업로드 오류: "+e.getMessage());
			}
			
			Map<String, String> map=new HashMap<String, String>();
			map.put("sajin",uploadName);
			return map;
		}
	   
	   @GetMapping({"/writeform"})
	   public String from()
	   {
		   return "index.jsp?go=gonggo/writegonggo";
	   }
	   
	   @PostMapping("/insert")
	   public Map<String, String> insertgonggo (@RequestBody CompanyDto dto)
	   {
		   dto.setEmpimg(this.uploadName);
		   mapper.insertGonggo(dto);
		   
		   Map<String, String> map=new HashMap<String, String>();
		   return map;
	   }

}
