package com.dapao.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dapao.domain.FileVO;
import com.dapao.domain.ItemVO;
import com.dapao.domain.LoveVO;
import com.dapao.domain.PayVO;
import com.dapao.domain.ReviewVO;
import com.dapao.domain.UserVO;
import com.dapao.service.ItemServiceImpl;
import com.dapao.service.UserServiceImpl;

import net.coobird.thumbnailator.Thumbnailator;

//http://localhost:8088/user/userMain

//@RequestMapping(value = "/board/*")
//~.bo 끝나는 주소를 설정한 것처럼
///board/~ 주로소 설정


@Controller
@RequestMapping(value = "/item/*")
public class ItemController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Inject
	private ItemServiceImpl iService;
	
	@Inject
	private UserServiceImpl uService;

	
	
	// http://localhost:8088/item/chat
	// 채팅GET - 미완성 
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public void chatGET() throws Exception {
		logger.debug("chatGET() 호출");
		
		logger.debug("연결된 뷰페이지(views/item/chat.jsp)를 출력");
		
	}
	
	
	// http://localhost:8088/item/itemSearch
	// 판매물품글 검색 조회GET - 판매글 작성 페이지로 이동
	@RequestMapping(value = "/itemSearch", method = RequestMethod.GET)
	public void itemSearchGET(String it_title, Model model, HttpSession session) throws Exception {
		logger.debug("itemSearchGET() 호출");
		
		logger.debug("검색단어 : " + it_title);
		
		// 검색
		List<ItemVO> searchItemVO = iService.itemSearch(it_title);
		// logger.debug("@@검색한 물품 정보 : " + searchItemVO);
		model.addAttribute("searchItemVO", searchItemVO);
		// 조회수 증가를 체크 : on - 1 , off - 2
		session.setAttribute("itemView", "on");
				
		logger.debug("연결된 뷰페이지(views/item/itemSearch.jsp)를 출력");
		
	}
	
	
	// http://localhost:8088/item/itemCate
	// 판매물품글 카테고리 조회GET - 판매글 작성 페이지로 이동
	@RequestMapping(value = "/itemCate", method = RequestMethod.GET)
	public void itemCateGET(String it_cate, Model model, HttpSession session) throws Exception {
		logger.debug("itemCateGET() 호출");
		logger.debug("검색 카테고리 : " + it_cate);
		
		// 검색
		List<ItemVO> cateItemVO = iService.itemCate(it_cate);
		model.addAttribute("cateItemVO", cateItemVO);
		// 조회수 증가를 체크 : on - 1 , off - 2
		session.setAttribute("itemView", "on");
				
		logger.debug("연결된 뷰페이지(views/item/itemCate.jsp)를 출력");
		
	}
	
	
	
	// http://localhost:8088/item/itemWrite
	// 판매글 작성GET - 판매글 작성 페이지로 이동
	@RequestMapping(value = "/itemWrite", method = RequestMethod.GET)
	public void itemWriteGET() throws Exception {
		logger.debug("itemWriteGET() 호출");
		
		logger.debug("연결된 뷰페이지(views/item/itemWrite.jsp)를 출력");
		
	}
	
	
	// 판매글 작성POST - 작성한 판매글 등록
	@RequestMapping(value = "/itemWrite", method = RequestMethod.POST)
	public String itemWritePOST(HttpSession session, ItemVO itemVO) throws Exception {
		logger.debug("itemWritePOST() 호출");
		int itno=0;
		// 세션 - 아이디
		String us_id = (String) session.getAttribute("us_id");
		itemVO.setUs_id(us_id);
		logger.debug("@@판매글 정보 : " + itemVO);
		
		// 서비스 -> DAO 호출 : 판매글  작성 등록
		int result = iService.itemWrite(itemVO);
		if(result == 1) { // 성공적으로 글 등록시
			
			// 등록한 글번호 받아오기
			itno = iService.itemWriteCheck(us_id);
			logger.debug("itno : " + itno);
		}
		
		
		if(result != 1) {
			logger.debug("판매글 등록 실패");
			return "redirect:/user/userMain";
		}
		
		logger.debug("판매글 등록 성공");

		
		final int it_no = itno;
		// 파일 저장 
		itemVO.getFileList().forEach(fileList->{
			
			fileList.setIt_no(it_no);
			iService.insertFile(fileList);
		});
		logger.debug("이미지 등록 완료");

		// 대표이미지 
		logger.debug("@@itemVO.getFileList() : " + itemVO.getFileList().get(0));
		
		FileVO vo = new FileVO();
		vo.setIt_no(itemVO.getFileList().get(0).getIt_no());
		vo.setUploadPath(itemVO.getFileList().get(0).getUploadPath());
		vo.setUuid(itemVO.getFileList().get(0).getUuid());
		vo.setFileName(itemVO.getFileList().get(0).getFileName());

		logger.debug("@@@vo@@@ : " + vo);
		
		int item_file_main = iService.itemFileMainInsert(vo);
		logger.debug("대표 이미지 등록 완료 item_file_main : " + item_file_main);

		logger.debug("연결된 뷰페이지(views/item/itemDetail.jsp)를 출력");
		
		 session.setAttribute("itemView", "off");
		//return "redirect:/mypage/userSellList";

		return "redirect:/item/itemDetail?it_no="+it_no;
		
	}
	
	// 날짜 폴더 만들기 위한 매서드( uploadAjaxAction 매서드보다 위에 선언하기 )
	private String getFolder() {
		
		// 현재 날짜 : Wed Aug 24 09:23:12 KST 2022
		Date date = new Date();
		
		// System.out.println("No format현재날짜 :   "+ date);
		// 간단 날짜 형식 : Wed Aug 24 09:23:12 KST 2022 -> 2022-08-24
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		// 현재날짜 date와 간단날짜형식 sdf연결 : 2022-08-24
		String str = sdf.format(date);
		
		// System.out.println("format 적용 현재날짜 : " + str);
		// 문자 찾아 바꾸기 : 2022-08-24 -> 2022\08\24
		return str.replace("-", "\\");
		
	}
	
	// 파일 업로드 ajax 
		@RequestMapping(value="/uploadAjaxAction" ,method = RequestMethod.POST)
		public ResponseEntity<ArrayList<FileVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile ){
			logger.debug("uploadAjaxActionPOST() 호출");
			logger.debug("uploadcontroller");
			logger.debug("update ajax post.....");
			
			// AttachFileVO 클래스 포함 관계로 만들어줌, 다중선택 : 배열
			ArrayList<FileVO> list = new ArrayList<>();
			
			// 폴더 경로 
			String uploadFolder = "F:\\upload";
			
			// 서버 업로드 경로와 getFolder메서드의 날짜 문자열을 결합해 하나의 폴더 생성
			File uploadPath = new File(uploadFolder, getFolder());
			
			// 폴더 생성 (F:\\upload현재날짜)
			if(uploadPath.exists()==false) { // uploadPath가 존재하지 않으면
				uploadPath.mkdirs();
			}
			
			
			for(MultipartFile multipartFile : uploadFile) {
				logger.debug("@@@@-----------------------------------------------");
				logger.debug("Upload File Name : " + multipartFile.getOriginalFilename());
				logger.debug("Upload File Size : " + multipartFile.getSize());
				
				// AttachFileVO클래스의 새로운 주소를 반복적으로 생성하여
				// ArrayList에 저장
				FileVO attachvo = new FileVO();
				
				// 파일 저장
				// 실제 파일명(multipartFile.getOriginalFilename())
				// UUID 적용 (UUID_multipartFile.getOriginalFilename())
				UUID uuid = UUID.randomUUID();
				logger.debug("uuid : " + uuid.toString());
				
				
				
				
				// AttachFileVO의 uploadPath 변수에 저장() : getFolder호출
				attachvo.setUploadPath(getFolder());
				
				// AttachFileVO의 fileName 변수에 저장() : 실제 파일 이름
				attachvo.setFileName(multipartFile.getOriginalFilename());
				
				// AttachFileVO의 uuid 변수에 저장()
				attachvo.setUuid(uuid.toString());
				
				
				String uploadFileName = uuid.toString() + "_" + multipartFile.getOriginalFilename();
				
				// IE has file path
				// uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				logger.debug("only file name : " + uploadFileName);
				
				
				// 파일저장 
				File saveFile = new File(uploadPath, uploadFileName);
				logger.debug("saveFile : " + saveFile);
				
				// F:\\upload 에 파일을 전송하는 매서드(transferTo)
				
					try {
						multipartFile.transferTo(saveFile); // 서버로 원본 파일 전송
						logger.debug("transgerTo 동작함");
						
						// 서버에 올리고자 하는 파일이 이미지이면
						if(checkImageType(saveFile)) {
							
							//AttachFileVO의 image변수에 저장()
							attachvo.setImage(true);
							
							// 파일 생성
							FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName ));
							// 썸네일 생성
							Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,150,150);
							
							thumbnail.close();
							
						}// checkImageType
						
						// AttachFileVO에 저장된 데이터를 배열에 추가 (add 매서드)
						list.add(attachvo);
						
					} catch (Exception e) {
						logger.debug(e.getMessage());
						logger.debug("transgerTo 문제생김");
					}
				
			}// for
			
			return new ResponseEntity<>(list, HttpStatus.OK);
		}// uploadAjaxPost 
	
	
	// 파일 썸네일 나오게 해주는 매서드 
	@RequestMapping(value="/display", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName){
		
		logger.debug("fileName@@ : " + fileName);
		
		File file = new File("F:\\upload/"+fileName);
		
		ResponseEntity<byte[]> result = null;
		// header가 content-type 파악할 수 있다
		HttpHeaders headers = new HttpHeaders();
		
		try {
			
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
						headers, HttpStatus.OK);	
			
			logger.debug("result : " + result);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 다운로드 주소 생성
		@RequestMapping(value = "/download", method = RequestMethod.GET)
		public ResponseEntity<Resource> downloadFile(String fileName){
			
			Resource resource = new FileSystemResource("F:\\upload/" + fileName);
			
			// 다운로드 시 파일의 이름을 처리
			String resourceName = resource.getFilename();
			
			HttpHeaders headers = new HttpHeaders();
			
			try {
				
				// 다운로드 파일이름이 한글일 때, 깨지지 않게 하기 위한 설정
				headers.add("Content-Disposition", "attachment;filename=" + new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));
						
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return new ResponseEntity<>(resource, headers, HttpStatus.OK);
		}

	// 업로드 파일이 이미지 파일인지 아닌지 구분하는 메소드 선언
	// 반환타입 메소드명  타입  변수명
	private boolean checkImageType(File file) {
		
		// probeContentType(파일 경로) : 파일 경로에 있는 파일 타입을 알아내는 메소드
		try {
			String contentType = Files.probeContentType(file.toPath());
			System.out.println("contentType=" + contentType);
			// 파일 타입이 image이면 true, 그 외에는 false
			return contentType.startsWith("image"); // startWith는 boolean 타입임 
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	// http://localhost:8088/item/itemDetail
	// 판매물건상세 GET - 글 정보를 불러오기 
	@RequestMapping(value = "/itemDetail", method = RequestMethod.GET)
	public String itemDetailGET(Integer it_no, Model model, HttpSession session) throws Exception {
		logger.debug("itemDetailGET() 호출");
		
		int love = 0;
		// 파라메터 자동수집
		logger.debug("@@판매글 번호 : " + it_no);
		
		// 세션 - 아이디
		String us_id = (String) session.getAttribute("us_id");
		if(us_id == null) { // 찜했는지 확인x
			
		}else {// 찜했는지 확인0
			ItemVO itemLove = new ItemVO();
			itemLove.setUs_id(us_id);
			itemLove.setIt_no(it_no);
			love = iService.itemLove(itemLove);
		}

		// 0 - 찜 안함,  1 -찜함 
		model.addAttribute("love",love);

		// 판매글 조회
		ItemVO itemVO = iService.itemDetail(it_no);
		logger.debug("@@판매글 정보 : " + itemVO);
		model.addAttribute("itemVO", itemVO);
		
		String sellerId = itemVO.getUs_id();
		
		// 판매자 정보 조회
		UserVO sellerVO = iService.sellerInfo(sellerId);
		logger.debug("@@판매자 정보 : " + sellerVO);
		model.addAttribute("sellerVO", sellerVO);
			
		
		// 판매자 상점 리뷰 조회 
//		List<ReviewVO> sellerRvVO = iService.sellerRv(itemVO);
//		logger.debug("판매자 상점 리뷰 정보 : " + sellerRvVO);
//		model.addAttribute("sellerRvVO", sellerRvVO);
//		
		
		// 판매자 다른 물품
		List<ItemVO> sellerItemVO = iService.sellerItem(itemVO);
		logger.debug("@@판매자 다른물품 : " + sellerItemVO);
		model.addAttribute("sellerItemVO", sellerItemVO);

		// 비슷한 상품 조회(같은 카테고리)
		List<ItemVO> sameCateVO = iService.sameCate(itemVO);
		logger.debug("@@비슷한 상품(같은카테): " + sameCateVO);
		model.addAttribute("sameCateVO", sameCateVO);
		

		// 조회수 증가를 체크 : on - 1 , off - 2
        if(session.getAttribute("itemView").equals("on")) {
             int viewcnt= iService.viewCnt(it_no);
             logger.debug("viewcnt : " + viewcnt);
            session.setAttribute("itemView", "off");
        }
		
		logger.debug("연결된 뷰페이지(views/item/itemDetail.jsp)를 출력");
		return "/item/itemDetail";
		
	}
	
	// 사진 출력 
	@ResponseBody
	@RequestMapping(value="/itemFile", method = RequestMethod.GET)
	public ResponseEntity<List<FileVO>> itemFile(int it_no){
		// 통신상태 정상이면 select 된 결과를 uploadAjaxPost로 보내라 
		logger.debug("itemFile(int it_no) 실행)");
		return new ResponseEntity<>(iService.itemFile(it_no),HttpStatus.OK);
	}	
	
	
	
	// http://localhost:8088/item/itemDetail	
	// 판매글상세 POST (받은 정보 + DB에서 정보 들고오기 => 결제 페이지로 이동)
	@RequestMapping(value="/itemDetail", method = RequestMethod.POST )
	public String itemDetailPOST(ItemVO itemVO,HttpSession session, Model model) {
		
		logger.debug("itemDetailPOST() 호출");
		
		// 전달정보 확인
		logger.debug("@@판매글 정보 확인 itemVO : " + itemVO);
		
		// 사용자의 아이디 정보 => 세션영역에 있는 정보 가져오기
		String us_id = (String) session.getAttribute("us_id");
		logger.debug("@@세션 아이디 확인 us_id : " + us_id);
		
		// 서비스 -> DAO
		// 결제에 필요한 정보 불러오기 매서드 실행
		//UserVO userVO = uService.userInfo(us_id);
		//logger.debug("@@회원정보 확인 userVO : " + userVO);

		// 정보 이동
		model.addAttribute("itemVO", itemVO);
		model.addAttribute("userVO", uService.userInfo(us_id));
		
		// 정보를 가지고 결제 창으로 이동
		return "redirect:/item/itemPay";
	}
	
	

	// 찜기능 GET - 찜 목록에 등록/삭제
	@ResponseBody
	@RequestMapping(value = "/itemLove", method = RequestMethod.GET)
	public int itemLoveGET(Integer love_value, Integer it_no, HttpSession session) throws Exception {
		logger.debug("itemLoveGet() 호출");
		
		// 파라메터 자동수집
		logger.debug("@@판매글 번호 : " + it_no);
		logger.debug("@@love_value : " + love_value);
		
		// 세션 - 아이디
		String us_id = (String) session.getAttribute("us_id");

		LoveVO loveVO = new LoveVO();
		loveVO.setUs_id(us_id);
		loveVO.setIt_no(it_no);
		
		if(love_value == 0) {
			// 찜하기 (insert)
			
			return iService.itemLoveInsert(loveVO);
		}
		
		// love_value == 1
		// 찜취소  (delete)
			
		return iService.itemLoveDelete(loveVO);
	}
	
	
	// http://localhost:8088/item/yourPage
	// 상대방 프로필 GET
	@RequestMapping(value = "/yourPage", method = RequestMethod.GET)
	public void yourPageGET(String us_id, Model model) throws Exception {
		logger.debug("yourPageGET() 호출");
		
		UserVO yourVO = iService.yourInfo(us_id);
		logger.debug("yourVO : " + yourVO );
		List<ItemVO> itemVO = iService.yourItem(us_id);
		logger.debug("@@itemVO : " + itemVO );
		
		model.addAttribute("yourInfo", yourVO);
		model.addAttribute("yourItemVO", itemVO);
		
		
		
		
	}
	
	
	// http://localhost:8088/item/coinCharge
	// 대나무페이 충전 GET - 충전페이지로 이동 
	@RequestMapping(value = "/coinCharge", method = RequestMethod.GET)
	public void coinChargeGET(HttpSession session, Model model) throws Exception {
		logger.debug("coinChargeGET() 호출");
		
		// 세션 아이디
		String us_id = (String)session.getAttribute("us_id");
		UserVO userVO = uService.userInfo(us_id);
		model.addAttribute("userVO", userVO);
		
		
	}

	// 대나무페이 충전 POST - 충전금액 입력
	@ResponseBody
	@RequestMapping(value = "/coinCharge", method = RequestMethod.POST)
	public void coinChargePOST(HttpSession session, Model model, PayVO payVO) throws Exception {
		logger.debug("coinChargePOST() 호출");
		
		// 세션 아이디, 코인 금액, url
		String us_id = (String)session.getAttribute("us_id");
		Integer us_coin = (Integer)session.getAttribute("us_coin");
		//String url = (String)session.getAttribute("URL");
		logger.debug("회원 아이디 확인 : " + us_id);
		logger.debug("충전전 코인금액 확인 : " + us_coin);
		
		logger.debug("@@payVO : " + payVO );
		payVO.setUs_id(us_id);
		payVO.setPay_kind("대나무페이");
		payVO.setPay_con("결제완료");
		logger.debug("@@@@@payVO : " + payVO );
		
		// 코인충전
		int us_result = iService.coinCharge(payVO);
		logger.debug(" us_result(성공시 1) : " + us_result);
		
		// 코인값 저장
		us_coin = iService.userCoin(us_id);
		session.setAttribute("us_coin", us_coin);
		logger.debug("충전후 코인금액 확인 : " + us_coin);
		
		
		// 결제 정보 입력
		int pay_result = iService.coinChargePay(payVO);
		logger.debug(" us_result : " + pay_result);
		logger.debug("결제 리스트나 이전 uri로 이동");
	
	
	}
	
	
}
