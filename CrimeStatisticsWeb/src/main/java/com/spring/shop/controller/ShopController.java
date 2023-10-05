package com.spring.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;
import com.spring.shop.service.ShopService;
import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.ProductVo;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	@Autowired
	private MemberService memberService;
	
	// 전체 호신용품 리스트
	@GetMapping("/list")
	public String getProductList(Model model) {
		List<ProductVo> allProductList = shopService.allPdList();
		model.addAttribute("list", allProductList);
		return "shop/pd_list";
	}
	
	// 카테고리별 상품 리스트
	@GetMapping("/list/{cateCode}")
	public String getCateCodePdList(@PathVariable("cateCode") int cateCode, Model model) {
		List<ProductVo> catePdList = shopService.catePdList(cateCode);
		model.addAttribute("list", catePdList);
		return "shop/pd_list";
	}
	
	// 상품 상세조회
	@GetMapping("/view")
	public String getProductView(Model model, @RequestParam("n") int pdNum, HttpSession session) {
		ProductVo productVo = shopService.getView(pdNum);
		String adminid = (String)session.getAttribute("adminid");
		String memberid = (String)session.getAttribute("memberid");
		model.addAttribute("product", productVo);
		model.addAttribute("memberid", memberid);
		
		if (adminid != null) {
			return "redirect:/admin/shop/view";
		} else {
			return "shop/view";
		}
		
	}
	
	// 장바구니 리스트
	@GetMapping("/cart-list")
	public String getCartList(Model model, HttpSession session) {
		String memberid = (String)session.getAttribute("memberid");
		List<CartVo> cartList = shopService.getCartList(memberid);
		model.addAttribute("cartList", cartList);
		return "shop/cart_list";
	}
	
	// 주문 페이지
	@GetMapping("/order")
	public String getOrderPage(@RequestParam("memberid") String memberid,
							   @RequestParam("cartNum") int cartNum,
							   Model model, HttpSession session) {
		CartVo cartVo = shopService.getCartOne(memberid, cartNum);
		String merchantUid = shopService.generateMerchantUid();
		MemberVo findMember = memberService.findById(memberid);
		model.addAttribute("cart", cartVo);
		model.addAttribute("merchant_uid", merchantUid);
		model.addAttribute("member", findMember);
		return "shop/order";
	}
	
	// 장바구니 선택 제품 주문 페이지
	@GetMapping("/select-order")
	public String getSelectOrderPage(@RequestParam List<Integer> cartNum, @RequestParam List<String> memberid, Model model) {
		
		int finalPaymentPrice = 0; 	// 최종 결제금액
		int totalCountStock = 0;	// 전체 제품 구매수량
		for (int i = 0; i < cartNum.size(); i++) {
			CartVo findCart = shopService.getCartOne(memberid.get(i), cartNum.get(i));
			finalPaymentPrice += findCart.getTotalPrice();
			totalCountStock   += findCart.getCartStock();
		}
		String findMemberid = memberid.get(0); 
		String merchantUid = shopService.generateMerchantUid();
		MemberVo findMember = memberService.findById(findMemberid);
		CartVo cartVo = shopService.getCartOne(memberid.get(0), cartNum.get(0));
		totalCountStock -= cartVo.getCartStock();
		model.addAttribute("pdThumbImg", cartVo.getPdThumbImg());
		model.addAttribute("pdName", cartVo.getPdName());
		model.addAttribute("pdPrice", cartVo.getPdPrice());
		model.addAttribute("cartStock", cartVo.getCartStock());
		model.addAttribute("finalPaymentPrice", finalPaymentPrice);
		model.addAttribute("totalCountStock", totalCountStock);
		model.addAttribute("merchant_uid", merchantUid);
		model.addAttribute("member", findMember);
		return "shop/select_order";
	}
	
	// 바로 구매 페이지
	@PostMapping("/view/order")
	public String buyNowPage(@RequestParam("pdThumbImg") String pdThumbImg,
							 @RequestParam("pdName") String pdName,
							 @RequestParam("cartStock") int cartStock,
							 @RequestParam("pdPrice") int pdPrice,
							 @RequestParam("pdNum") int pdNum,
							 Model model, HttpSession session) {
		CartVo cartVo = new CartVo();
		String memberid = (String)session.getAttribute("memberid");
		String merchantUid = shopService.generateMerchantUid();
		MemberVo findMember = memberService.findById(memberid);
		cartVo.setPdThumbImg(pdThumbImg);
		cartVo.setPdName(pdName);
		cartVo.setCartStock(cartStock);
		cartVo.setPdPrice(pdPrice);
		cartVo.setPdNum(pdNum);
		cartVo.setTotalPrice();
		
		model.addAttribute("cart", cartVo);
		model.addAttribute("member", findMember);
		model.addAttribute("merchant_uid", merchantUid);
		
		return "shop/order";
	}
	
}
