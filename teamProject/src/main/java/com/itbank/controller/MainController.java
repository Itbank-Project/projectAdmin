package com.itbank.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.admin.AdminDTO;
import com.itbank.calendar.CalendarDTO;
import com.itbank.hotel.HotelDTO;
import com.itbank.reply.ReplyDTO;
import com.itbank.reservation.ReservationDTO;
import com.itbank.review.ReviewDTO;
import com.itbank.room.RoomDTO;
import com.itbank.service.AdminService;
import com.itbank.service.CalendarService;
import com.itbank.service.FileService;
import com.itbank.service.HotelService;
import com.itbank.service.ReplyService;
import com.itbank.service.ReservationService;
import com.itbank.service.ReviewService;
import com.itbank.service.RoomService;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

@Controller
public class MainController {

	@Autowired private AdminService as;
	@Autowired private HotelService hs;
	@Autowired private FileService fs;
	@Autowired private RoomService rs;
	@Autowired private ReviewService reviewService;
	@Autowired private ReservationService reservationService;
	@Autowired private CalendarService cs;
	@Autowired private ReplyService replyService;
	
	private final String serverIp = "182.212.181.172";	// ????????? ????????? IP ?????? DNS Name
	private final int serverPort = 22;					// SSH Protocol	Port
	private final String serverUser = "root";			// Linux User
	private final String serverPass = "Dudwns12!@";				// password
	private ChannelSftp chSftp = null;	
	
	
	// ?????????, ????????????
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@PostMapping("/")
	public ModelAndView index(HttpSession session, HttpServletRequest request) {
		AdminDTO dto = (AdminDTO) session.getAttribute("login");
		String ad_id = dto.getAd_id();
		String start =  request.getParameter("startDate");
		String end = request.getParameter("endDate");
		System.out.println("???????????? : "+ start);
		System.out.println("????????? : " + end);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", start);
		map.put("endDate", end);
		map.put("ad_id", ad_id);
		
		ModelAndView mav = new ModelAndView("index");
		List<ReservationDTO> list = reservationService.getReservationList(map);
		String cancelCount = reservationService.getCancelCount(map);
		String reservationCount = reservationService.getReservationCount(map);
		
		mav.addObject("list", list);
		mav.addObject("cancelCount",cancelCount);	// ??????????????? ??????
		mav.addObject("reservationCount", reservationCount);	// ??????????????? ??????
		return mav;
	}
	
	// ?????????
	@GetMapping("login")
	public void login() {}

	// ?????????(??????)
	@PostMapping("login")
	public String login(AdminDTO dto, HttpServletRequest request, HttpServletResponse response, HttpSession session, String uri) throws IOException {
		String userid = dto.getAd_id();
		String storeid = request.getParameter("storeid");
		AdminDTO login = as.getUser(dto);
		System.out.println(login);
		if(login == null) {
			response.setContentType("text/html; charset=UTF-8");
            		PrintWriter out = response.getWriter();
            		out.println("<script> alert('????????? ????????? ??????????????????.');  </script>");
            		out.flush();
            		return "login"; 
		}
		Cookie c = new Cookie("userid", userid);
		session.setAttribute("login", login);
		boolean flag = (storeid != null) && (session.getAttribute("login") != null);
		c.setMaxAge(flag ? 60 * 60 * 24 * 100 : 0);	
		response.addCookie(c);	
		uri = (uri == null) ? "/" : uri;
		return "redirect:" + uri ;
	}
	
	// ????????????
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	// ????????????
	@GetMapping("join")
	public void join() {}

	// ????????? ??????
	@GetMapping("findID")
	public void findID() {}

	// ???????????? ??????
	@GetMapping("findPW")
	public void findPW() {}
	
	// ?????? ?????? ??????
	@GetMapping("modify")
	public void modify() {}
	
	// ????????????
	@GetMapping("roomStatus")
	public ModelAndView roomStatus(HttpSession session) {
		AdminDTO dto = (AdminDTO) session.getAttribute("login");
		String ad_id = dto.getAd_id();
		
		HotelDTO hotelDTO = hs.selectHotel(ad_id);
		System.out.println(hotelDTO);
		
		ModelAndView mav = new ModelAndView("roomStatus");
		
		if(hotelDTO != null) {
			
			String ho_name = hotelDTO.getHo_name();
			List<CalendarDTO> calendarList = cs.getCalendar(ho_name);
			List<RoomDTO> roomList = rs.getList(ho_name);
			
			int roomCount = roomList.size();
			
			mav.addObject("calendarList", calendarList);
			mav.addObject("roomCount", roomCount);
			
		}
			
		
				
		return mav;
	}
	
	
	// ??????
	@GetMapping("trueReview")
	public ModelAndView trueReview(HttpSession session) {
		ModelAndView mav = new ModelAndView("trueReview") ;
		AdminDTO adminDTO = (AdminDTO) session.getAttribute("login");
		String ad_id = adminDTO.getAd_id();
		
		// ?????? ??????????????????
		HotelDTO dto = hs.selectHotel(ad_id);
		mav.addObject("dto", dto);
		
		// ??????????????????
		List<ReviewDTO> list = reviewService.getReviewList(ad_id);
		
		for(int i = 0; i< list.size();i++) {
			int review_idx = list.get(i).getReview_idx();
			
			System.out.println("for : " + review_idx);
			List<ReplyDTO> replyList = replyService.getReplyList(review_idx);
			for(ReplyDTO vo : replyList) {
				System.out.println("fo??? : " + vo.getReply_review_idx());
				if(review_idx == vo.getReply_review_idx()) {
					System.out.println(vo.getReply_opinion());
					System.out.println("aaaa");
					list.get(i).setReply_opinion(vo.getReply_opinion());
					break;
				}
			}

		}
		mav.addObject("list", list);
		
		// ??????????????????
		int countAll = reviewService.getCountAll(ad_id);
		mav.addObject("countAll", countAll);
		
		// ?????? ????????????
		int goodCount = reviewService.getGoodCount(ad_id);
		mav.addObject("goodCount", goodCount);
		
		return mav;
	}

	// ???????????? ??????
	@GetMapping("enterHotelinformation/{ad_id}")
	public ModelAndView enterHotelinformation(@PathVariable String ad_id) {
		ModelAndView mav = new ModelAndView("enterHotelinformation");
		HotelDTO dto = hs.selectHotel(ad_id);
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	// ???????????? 
	@GetMapping("hotelInformation")
	public ModelAndView hotelInformation(HttpSession session) {
		AdminDTO adminDTO = (AdminDTO) session.getAttribute("login");
		String ad_id = adminDTO.getAd_id();
		System.out.println(ad_id);
		ModelAndView mav = new ModelAndView("hotelInformation");
		
		HotelDTO dto = hs.selectHotel(ad_id);
		mav.addObject("dto", dto);
		
		if(dto != null) {
			String ho_name = dto.getHo_name();
			System.out.println("??????????????? : " + ho_name);
			
			List<RoomDTO> roomList = rs.getList(ho_name);
			
			mav.addObject("roomList", roomList);
		}
		
		return mav;
	}
	
	// ???????????? ??????
	@PostMapping("enterHotelinformation/{ad_id}")
	public ModelAndView enterHotelinformation(@PathVariable String ad_id, MultipartHttpServletRequest request) throws IllegalStateException, IOException, JSchException, SftpException {
		ModelAndView mav = new ModelAndView("index");
		MultipartFile file = request.getFile("ho_uploadfile");
		String ho_name = request.getParameter("ho_name");
		String ho_pnum = request.getParameter("ho_pnum");
		String ho_address = request.getParameter("ho_address");
		String ho_check_in = request.getParameter("ho_check_in");
		String ho_check_out = request.getParameter("ho_check_out");
		String ho_description = request.getParameter("ho_description");
		String ho_ad_id = request.getParameter("ho_ad_id");
		String ho_parking = request.getParameter("ho_parking");
		String ho_wifi = request.getParameter("ho_wifi");
		String ho_pc = request.getParameter("ho_pc");
		String ho_breakfast = request.getParameter("ho_breakfast");
		String ho_smoke = request.getParameter("ho_smoke");
		String ho_pool = request.getParameter("ho_pool");
		
		HotelDTO dto = new HotelDTO();
		
		dto.setHo_ad_id(ho_ad_id);
		dto.setHo_address(ho_address);
		dto.setHo_breakfast(ho_breakfast);
		dto.setHo_check_in(ho_check_in);
		dto.setHo_check_out(ho_check_out);
		dto.setHo_description(ho_description);
		dto.setHo_name(ho_name);
		dto.setHo_parking(ho_parking);
		dto.setHo_pc(ho_pc);
		dto.setHo_pnum(ho_pnum);
		dto.setHo_pool(ho_pool);
		dto.setHo_smoke(ho_smoke);
		dto.setHo_uploadfile(file.getOriginalFilename().replace(" ", "_"));
		dto.setHo_wifi(ho_wifi);

		if(dto.getHo_parking() == null) {dto.setHo_parking("");	}
		if(dto.getHo_wifi() == null) {dto.setHo_wifi("");	}
		if(dto.getHo_pc() == null) {dto.setHo_pc("");	}
		if(dto.getHo_breakfast() == null) {dto.setHo_breakfast("");	}
		if(dto.getHo_smoke() == null) {dto.setHo_smoke("");	}
		if(dto.getHo_pool() == null) {dto.setHo_pool("");	}
		
		
		Session sess = null;
		Channel channel = null;
		JSch jsch = new JSch();
		
		sess = jsch.getSession(serverUser, serverIp, serverPort);	// ?????? ?????? ??????
		sess.setPassword(serverPass);								// ????????????
		sess.setConfig("StrictHostKeyChecking", "no");				// SSH??? ??? ?????? ?????? ??????(id/pw x )
		
		sess.connect();		// 22??? ????????? SSH, SCP, SFTP ?????? ?????? ????????? ????????????
		System.out.println("sftp > Connected !!");
		
		channel = sess.openChannel("sftp");		// SFTP??? ???????????? ????????? ??????
		channel.connect();
		
		chSftp = (ChannelSftp)channel;
		
		File tmp = new File(file.getOriginalFilename().replace(" ", "_"));		// ???????????? ????????? ????????? ????????? ??????
		file.transferTo(tmp);			// ????????? ????????? File????????? ??????
		
		FileInputStream fis = new FileInputStream(tmp);		// tmp??? ????????? ???????????? ?????? ?????????
		chSftp.cd("/var/www/html"); 						// /var/www/html : apache??? ?????? ??????
		chSftp.put(fis, file.getOriginalFilename().replace(" ", "_"));		// ???????????? ????????? ???????????? ?????????
		
		System.out.println("sftp > transfer complete !!");
		
		fis.close();	// ????????? ??????
		chSftp.exit();	// SFTP ?????? ??????
		tmp.delete();	// ???????????? ??????
		
		System.out.println("sftp> exit !!");
		String fileName = "" ;
		fileName += "http://";		// ????????????, ?????? ????????? apache ???????????? ??????
		fileName += serverIp;		// ????????? IP ?????? DNA Name
		fileName += ":9000/";		// ?????? ????????? apache port, ???????????? 80
		fileName += file.getOriginalFilename().replace(" ", "_"); // ???????????? ????????? ??????
		
		mav.addObject("uploadFilePath", fileName);
		System.out.println("fileName : " + fileName);
		
		int row = hs.insertHotel(dto);
		System.out.println("row : " + row);
		
		return mav;
	}
	
	// ???????????????
	@GetMapping("calculate")
	public ModelAndView calculate(HttpSession session) {
		ModelAndView mav = new ModelAndView("calculate");
		AdminDTO dto = (AdminDTO) session.getAttribute("login");
		mav.addObject("dto", dto);
		return mav;
	}
	
	// ???????????? ??????
	@GetMapping("hotelInformationModification")
	public ModelAndView hotelInformationModification(HttpSession session) {
		AdminDTO adminDTO = (AdminDTO) session.getAttribute("login");
		String ad_id = adminDTO.getAd_id();
		System.out.println(ad_id);
		ModelAndView mav = new ModelAndView("hotelInformationModification");
		HotelDTO dto = hs.selectHotel(ad_id);
		mav.addObject("dto", dto);
		return mav;
	}
	
		// ???????????? ??????
		@PostMapping("hotelInformationModification")
		public ModelAndView hotelModifi(MultipartHttpServletRequest request) throws  IllegalStateException,IOException, JSchException, SftpException {
			ModelAndView mav = new ModelAndView("index");
			MultipartFile file = request.getFile("ho_uploadfile");
			String ho_name = request.getParameter("ho_name");
			String ho_pnum = request.getParameter("ho_pnum");
			String ho_address = request.getParameter("ho_address");
			String ho_check_in = request.getParameter("ho_check_in");
			String ho_check_out = request.getParameter("ho_check_out");
			String ho_description = request.getParameter("ho_description");
			String ho_ad_id = request.getParameter("ho_ad_id");
			String ho_parking = request.getParameter("ho_parking");
			String ho_wifi = request.getParameter("ho_wifi");
			String ho_pc = request.getParameter("ho_pc");
			String ho_breakfast = request.getParameter("ho_breakfast");
			String ho_smoke = request.getParameter("ho_smoke");
			String ho_pool = request.getParameter("ho_pool");

			HotelDTO dto = new HotelDTO();
			
			System.out.println("========================");
			System.out.println(file.getOriginalFilename());
			System.out.println(file.getName());
			System.out.println(file.getContentType());
			System.out.println(file.getSize());
			System.out.println("=========================");
			
			dto.setHo_ad_id(ho_ad_id);
			dto.setHo_address(ho_address);
			dto.setHo_breakfast(ho_breakfast);
			dto.setHo_check_in(ho_check_in);
			dto.setHo_check_out(ho_check_out);
			dto.setHo_description(ho_description);
			dto.setHo_name(ho_name);
			dto.setHo_parking(ho_parking);
			dto.setHo_pc(ho_pc);
			dto.setHo_pnum(ho_pnum);
			dto.setHo_pool(ho_pool);
			dto.setHo_smoke(ho_smoke);
			dto.setHo_uploadfile(file.getOriginalFilename().replace(" ", "_"));
			dto.setHo_wifi(ho_wifi);
			
			if(dto.getHo_parking() == null) {dto.setHo_parking("");	}
			if(dto.getHo_wifi() == null) {dto.setHo_wifi("");	}
			if(dto.getHo_pc() == null) {dto.setHo_pc("");	}
			if(dto.getHo_breakfast() == null) {dto.setHo_breakfast("");	}
			if(dto.getHo_smoke() == null) {dto.setHo_smoke("");	}
			if(dto.getHo_pool() == null) {dto.setHo_pool("");	}

			
			Session sess = null;
			Channel channel = null;
			JSch jsch = new JSch();
			
			sess = jsch.getSession(serverUser, serverIp, serverPort);	// ?????? ?????? ??????
			sess.setPassword(serverPass);								// ????????????
			sess.setConfig("StrictHostKeyChecking", "no");				// SSH??? ??? ?????? ?????? ??????(id/pw x )
			
			sess.connect();		// 22??? ????????? SSH, SCP, SFTP ?????? ?????? ????????? ????????????
			System.out.println("sftp > Connected !!");
			
			channel = sess.openChannel("sftp");		// SFTP??? ???????????? ????????? ??????
			channel.connect();
			
			chSftp = (ChannelSftp)channel;
			
			File tmp = new File(file.getOriginalFilename().replace(" ", "_"));		// ???????????? ????????? ????????? ????????? ??????
			file.transferTo(tmp);			// ????????? ????????? File????????? ??????
			
			FileInputStream fis = new FileInputStream(tmp);		// tmp??? ????????? ???????????? ?????? ?????????
			chSftp.cd("/var/www/html"); 						// /var/www/html : apache??? ?????? ??????
			chSftp.put(fis, file.getOriginalFilename().replace(" ", "_"));		// ???????????? ????????? ???????????? ?????????
			
			System.out.println("sftp > transfer complete !!");
			
			fis.close();	// ????????? ??????
			chSftp.exit();	// SFTP ?????? ??????
			tmp.delete();	// ???????????? ??????
			
			System.out.println("sftp> exit !!");
			String fileName = "" ;
			fileName += "http://";		// ????????????, ?????? ????????? apache ???????????? ??????
			fileName += serverIp;		// ????????? IP ?????? DNA Name
			fileName += ":9000/";		// ?????? ????????? apache port, ???????????? 80
			fileName += file.getOriginalFilename().replace(" ", "_"); // ???????????? ????????? ??????
			
			mav.addObject("uploadFilePath", fileName);
			System.out.println("fileName : " + fileName);
			int row = hs.modifiHotel(dto);
			System.out.println("row : " + row);
			return mav;
			
		}	

	//  ?????? ??????
	@GetMapping("insertRoom/{ho_name}")
	public ModelAndView insertRoom(@PathVariable String ho_name) {
		ModelAndView mav = new ModelAndView("insertRoom");
		mav.addObject("ho_name", ho_name);
		return mav;
	}
	
	// ?????? ?????? ??????
	@PostMapping("insertRoom/{ho_name}")
	public ModelAndView insertRoom(@PathVariable String ho_name, MultipartHttpServletRequest request) throws IllegalStateException, IOException, JSchException, SftpException {
		ModelAndView mav = new ModelAndView("index");
		MultipartFile file = request.getFile("ro_uploadfile");
		String ro_pk = request.getParameter("ro_pk");
		String ro_limitperson = request.getParameter("ro_limitperson");
		String ro_badtype = request.getParameter("ro_badtype");
		String ro_description = request.getParameter("ro_description");
		String ro_ho_name = ho_name;
		String ro_roomtype = request.getParameter("ro_roomtype");
		
		RoomDTO dto = new RoomDTO();
		
		int ro_limitperson2 = Integer.parseInt(ro_limitperson);
		
		dto.setRo_pk(ro_pk);
		dto.setRo_badtype(ro_badtype);
		dto.setRo_description(ro_description);
		dto.setRo_ho_name(ro_ho_name);
		dto.setRo_limitperson(ro_limitperson2);
		dto.setRo_roomtype(ro_roomtype);
		dto.setRo_uploadfile(file.getOriginalFilename().replace(" ", "_"));
		
	
		Session sess = null;
		Channel channel = null;
		JSch jsch = new JSch();
		
		sess = jsch.getSession(serverUser, serverIp, serverPort);	// ?????? ?????? ??????
		sess.setPassword(serverPass);								// ????????????
		sess.setConfig("StrictHostKeyChecking", "no");				// SSH??? ??? ?????? ?????? ??????(id/pw x )
		
		sess.connect();		// 22??? ????????? SSH, SCP, SFTP ?????? ?????? ????????? ????????????
		System.out.println("sftp > Connected !!");
		
		channel = sess.openChannel("sftp");		// SFTP??? ???????????? ????????? ??????
		channel.connect();
		
		chSftp = (ChannelSftp)channel;
		
		File tmp = new File(file.getOriginalFilename().replace(" ", "_"));		// ???????????? ????????? ????????? ????????? ??????
		file.transferTo(tmp);			// ????????? ????????? File????????? ??????
		
		FileInputStream fis = new FileInputStream(tmp);		// tmp??? ????????? ???????????? ?????? ?????????
		chSftp.cd("/var/www/html"); 						// /var/www/html : apache??? ?????? ??????
		chSftp.put(fis, file.getOriginalFilename().replace(" ", "_"));		// ???????????? ????????? ???????????? ?????????
		
		System.out.println("sftp > transfer complete !!");
		
		fis.close();	// ????????? ??????
		chSftp.exit();	// SFTP ?????? ??????
		tmp.delete();	// ???????????? ??????
		
		System.out.println("sftp> exit !!");
		String fileName = "" ;
		fileName += "http://";		// ????????????, ?????? ????????? apache ???????????? ??????
		fileName += serverIp;		// ????????? IP ?????? DNA Name
		fileName += ":9000/";		// ?????? ????????? apache port, ???????????? 80
		fileName += file.getOriginalFilename().replace(" ", "_"); // ???????????? ????????? ??????
		
		mav.addObject("uploadFilePath", fileName);
		System.out.println("fileName : " + fileName);
		
		int row = rs.insertRoom(dto);
		System.out.println("row : " + row);
		
		return mav;
	}
	

}
