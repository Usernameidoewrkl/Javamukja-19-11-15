package spring.sts.javamukja;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.mapper.GradeInter;
import spring.model.mapper.MemberInter;
import spring.model.mapper.NoticeInter;
import spring.model.mapper.RecipeInter;
import spring.model.mapper.TalkInter;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private RecipeInter rinter;
	
	@Autowired
	private MemberInter minter;
	
	@Autowired
	private TalkInter tinter;
	
	@Autowired
	private NoticeInter ninter;
	
	@Autowired
	private GradeInter ginter;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Map map) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		int memCnt = minter.memberCount(); //멤버 수
		int rcpCnt = rinter.total(map); // 레시피 수
		int admCnt = minter.adminCount(); // 관리자 수
		int talkCnt = tinter.total(map); // 자유글 수
		int grdCnt = ginter.total(map); //등업 수
		int notiCnt = ninter.total(map); // 공지 수
		int totalCnt = notiCnt + talkCnt + grdCnt + rcpCnt;
		
		
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("memCnt", memCnt);
		model.addAttribute("admCnt", admCnt);
		model.addAttribute("rcpCnt", rcpCnt);
		model.addAttribute("totalCnt", totalCnt);
		
		return "/home";
	}
	
}
