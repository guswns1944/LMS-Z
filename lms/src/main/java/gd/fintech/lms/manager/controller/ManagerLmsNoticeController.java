package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.service.ManagerLmsNoticeService;
import gd.fintech.lms.vo.LmsNotice;


@Controller
public class ManagerLmsNoticeController {
	@Autowired ManagerLmsNoticeService managerLmsNoticeService;
	
	//공지사항 조회 시 조회수 +1
	@GetMapping("/noticeCountup/{lmsNoticeNo}/{currentPage}")
	public String noticeCountUp(@PathVariable(name="lmsNoticeNo") int lmsNoticeNo,
								@PathVariable(name="currentPage") int currentPage) {
		managerLmsNoticeService.modifyLmsNoticeCount(lmsNoticeNo);
		return "redirect:/manager/lmsNoticeOne/"+lmsNoticeNo+"/"+currentPage;
	}
	/*
	 * 조회수 +1 메서드를 따로 만들어서 공지사항상세보기에서
	 * 새로고침을 해도 count+1되지 않도록 함
	 */
	//공지사항 리스트 
	@GetMapping ("/manager/lmsNoticeList/{currentPage}")
	public String LmsNotice(Model model,
							@PathVariable(value = "currentPage") int currentPage) {
		
		//한 페이지 출력 공지사항 개수 
		int rowPerPage = 5;
		int startPage = ((currentPage/11)*rowPerPage)+1;
		
		//last 페이지
		int lastPage = 0; 
		//공지사항 total Count
		int totalRow = managerLmsNoticeService.getLmsNoticeCount();
		
		//나누어 떨어지면 
		if(totalRow % rowPerPage == 0) {
			lastPage = totalRow / rowPerPage;
		} else {//나누어 떨어지지 않는다면
			lastPage = totalRow / rowPerPage +1;
		}
		
		List<LmsNotice> lmsNoticeList = managerLmsNoticeService.getLmsNoticeList(currentPage, rowPerPage);

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("totalRow",totalRow);
		model.addAttribute("lmsNoticeList", lmsNoticeList);
		model.addAttribute("startPage",startPage);
		return "manager/lmsNoticeList";
	}
	
	//공지사항 작성 폼 
	@GetMapping ("/manager/addLmsNotice/{managerId}/{currentPage}")
	public String addLmsNotice(Model model,
							@PathVariable(name="managerId") String managerId,
							@PathVariable(name="currentPage") int currentPage) {
		String managerName=managerLmsNoticeService.getManagerName(managerId);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("managerName",managerName);
		return "manager/addLmsNotice";
	}
	
	//공지사항 작성 액션 
	@PostMapping("/manager/addLmsNotice")
	public String addLmsNotice(LmsNotice lmsNotice) {
		managerLmsNoticeService.addLmsNotice(lmsNotice);
		return "redirect:/manager/lmsNoticeList/1";
	}
	
	//공지사항 상세내용 
	@GetMapping("/manager/lmsNoticeOne/{lmsNoticeNo}/{currentPage}")
	public String managerNoticeOne(Model model,
								@PathVariable(name="lmsNoticeNo") int lmsNoticeNo,
								@PathVariable(name="currentPage") int currentPage) {
		LmsNotice lmsNotice = managerLmsNoticeService.getLmsNoticeOne(lmsNoticeNo);
		model.addAttribute("lmsNotice",lmsNotice);
		model.addAttribute("currentPage",currentPage);
		return "manager/lmsNoticeOne";
	}
	
	//공지사항 수정 폼 
	@GetMapping("/manager/modifyLmsNotice/{lmsNoticeNo}/{currentPage}")
	public String modifyLmsNotice(Model model,
								@PathVariable(value ="lmsNoticeNo")int lmsNoticeNo,
								@PathVariable(name="currentPage") int currentPage) {
		LmsNotice lmsNotice = managerLmsNoticeService.getLmsNoticeOne(lmsNoticeNo);
		model.addAttribute("lmsNotice", lmsNotice);
		model.addAttribute("currentPage",currentPage);
		return "manager/modifyLmsNotice";
	}
	
	//공지사항 수정 액션
	@PostMapping("/manager/modifyLmsNotice/{currentPage}")
	public String modifyLmsNotice(LmsNotice lmsNotice,
								@PathVariable(name="currentPage") int currentPage) {
		managerLmsNoticeService.modifyLmsNotice(lmsNotice);
		return "redirect:/manager/lmsNoticeOne/"+lmsNotice.getLmsNoticeNo()+"/"+currentPage;
	}
	
	//공지사항 삭제 
	@GetMapping("/manager/removeLmsNotice/{lmsNoticeNo}/{currentPage}")
	public String removeLmsNotice(@PathVariable(name="lmsNoticeNo")int lmsNoitceNo,
								@PathVariable(name="currentPage") int currentPage) {
		managerLmsNoticeService.removeLmsNotice(lmsNoitceNo);
		return"redirect:/manager/lmsNoticeList/"+currentPage;
	}
}