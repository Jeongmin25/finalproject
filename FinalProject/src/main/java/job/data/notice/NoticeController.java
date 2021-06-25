package job.data.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class NoticeController {
	
	@Autowired
	NoticeMapper mapper;
	
	@GetMapping("/notice/list")
	public ModelAndView list()
	{
		ModelAndView mview=new ModelAndView();
		//총갯수
		int totalCount=mapper.getTotalCount();
		mview.addObject("totalCount",totalCount);
		//목록 가져오기
		List<NoticeDto> list=mapper.getAllDatas();
		mview.addObject("list",list);
		mview.setViewName("notice/list");
		return mview;
	}
	
	

}


