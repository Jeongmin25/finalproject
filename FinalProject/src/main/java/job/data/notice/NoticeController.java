package job.data.notice;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import job.data.notice.NoticeDto;



@Controller
public class NoticeController {
	
	@Autowired
	NoticeMapper mapper;
	
	@GetMapping("/adminnoticelist")
	public ModelAndView list()
	{
		ModelAndView mview=new ModelAndView();
		//총갯수
		int totalCount=mapper.getTotalCount();
		mview.addObject("totalCount",totalCount);
		//목록 가져오기
		List<NoticeDto> list=mapper.getAllDatas();
		mview.addObject("list",list);
		mview.setViewName("/adminnotice/list");
		return mview;
	}
	
	
	@GetMapping("/adminnotice/addform")
	public String addform()
	{
		return "/adminnotice/addform"; 
	}
	

	@PostMapping("/adminnotice/insert")
	public String insert(@ModelAttribute NoticeDto dto,
			@RequestParam String num_n,
			HttpServletRequest request)
	{
		String path=request.getSession().getServletContext().getRealPath("/noticephoto");
		System.out.println(path);
		//파일명 앞에 붙일 날짜구하기
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName="photo"+sdf.format(new Date())
			+"_"+dto.getUpload().getOriginalFilename();
		//dto에 업로드될 파일명 저장
		dto.setPhoto(fileName);
		
		//업로드
		MultipartFile uploadFile=dto.getUpload();
		try {
			uploadFile.transferTo(new File(path+"\\"+fileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//db insert
		mapper.insertNotice(dto);
		return "redirect:list";
		
		}
	
	
		@GetMapping("/adminnotice/contents")
		public String content(Model model,
				
				@RequestParam String num_n,
				@RequestParam(defaultValue = "no") String key)
		{
			//목록에서 올경우에만 조회수 증가
			if(key.equals("list"))
				mapper.updateViewCount(num_n);
			
			//dto 가져와서 model 에 저장
			
			NoticeDto dto=mapper.getData(num_n);
			model.addAttribute("dto",dto);
			
			return "/adminnotice/contents";
		}
		
		
		
		@GetMapping("/adminnotice/updateform")
		public ModelAndView updateForm(@RequestParam String num_n)
		{
			ModelAndView mview=new ModelAndView();
			NoticeDto dto=mapper.getData(num_n);
			
			mview.addObject("dto",dto);
			mview.setViewName("/adminnotice/updateform");
			return mview;
		}
		
		
		
		@PostMapping("/adminnotice/updatenotice")
		public String update(@ModelAttribute NoticeDto dto,
				@RequestParam String num_n,
				HttpServletRequest request)
		{
			String path=request.getSession().getServletContext().getRealPath("/noticephoto");
			System.out.println(path);
		     String f=dto.getUpload().getOriginalFilename();
			//파일명 앞에 붙일 날짜구하기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String fileName="photo"+sdf.format(new Date())
				+"_"+dto.getUpload().getOriginalFilename();
			//dto에 업로드될 파일명 저장
		
	         if(f.equals("")){ 
	        	 NoticeDto ato=mapper.getData(num_n);
	        	 dto.setPhoto(ato.getPhoto());
	        	//db update
	 			mapper.updateNotice(dto);
	        	 
	         }
	         else {
			//업로드
			MultipartFile uploadFile=dto.getUpload();
			try {
				uploadFile.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			mapper.updateNotice(dto);
	         }
			return "redirect:contents?num_n="+dto.getNum_n();
			
		}
		
		
		
			@GetMapping("/adminnotice/deletenotice")
			public String delete(@RequestParam String num_n)
			{
				mapper.deleteNotice(num_n);
				return "redirect:list";
			}	
	}

	




