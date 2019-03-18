/**
 * 
 */
package com.hhi.wiart.article.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hhi.wiart.article.model.ArticleVO;
import com.hhi.wiart.article.service.ArticleService;
import com.hhi.wiart.common.paging.Criteria;
import com.hhi.wiart.common.paging.PageMaker;

/**
 * <PRE>
 * 1. ClassName: ArticleController
 * 2. FileName : ArticleController.java
 * 3. Package  : com.hhi.wiart.article.controller
 * 4. Comment  :
 * 5. 작성자   : hhi
 * 6. 작성일   : 2018. 5. 14.
 * 7. 변경이력
 *		이름	:	일자	    : 변경내용
 *     ———————————————————————————————————
 *		hhi :	2018. 5. 14.	: 신규 개발.
 * </PRE>
 */

@Controller
public class ArticleController {
    private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

    private final ArticleService articleService;

    @Inject
    public ArticleController(ArticleService articleService) {
        this.articleService = articleService;
    }
    
    /**
     
	페이지 번호 출력처리를 위한 데이터들 : 시작 페이지 번호, 끝 페이지 번호, 전체 게시글의 갯수, 이전 링크, 다음 링크
	끝 페이지 번호 계산식 : Math.ceil(현재 페이지 번호 / 페이지 번호의 갯수) * 페이지번호의 갯수
	시작 페이지 번호 계산식 : (끝 페이지 번호 - 페이지 번호의 갯수) + 1
	끝 페이지 번호의 보정 계산식 : Math.ceil(전체 게시글의 갯수 / 페이지 당 출력할 게시글의 갯수)
	이전 링크 활성/비활성 계산식 : 시작 페이지 번호 == 1 ? fales : true
	다음 링크 활성/비활성 계산식 : 끝 페이지 번호 * 페이지 당 출력할 게시글 갯수 >= 전체 게시글의 갯수 ? fales : true

     */
    @RequestMapping(value = "/article/listPaging", method = RequestMethod.GET)
    public String listPaging(Model model, Criteria criteria) throws Exception {
        logger.info("listPaging ...");

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(criteria);
        pageMaker.setTotalCount(articleService.countArticles(criteria));

        model.addAttribute("articles", articleService.listCriteria(criteria));
        model.addAttribute("pageMaker", pageMaker);

        return "/article/list_paging";
    }
    
    @RequestMapping(value = "/article/readPaging", method = RequestMethod.GET)
    public String readPaing(@RequestParam("articleNo") int articleNo,
    						@ModelAttribute("crteria") Criteria criteria,
    						Model model) throws Exception {
    	
    	model.addAttribute("article", articleService.read(articleNo));
    	
    	return "/article/read_paging";
    } 	
    
    @RequestMapping(value = "/modifyPaging", method = RequestMethod.GET)
    public String modifyGETPaging(@RequestParam("articleNo") int articleNo,
                                  @ModelAttribute("criteria") Criteria criteria,
                                  Model model) throws Exception {

        logger.info("modifyGetPaging ...");
        model.addAttribute("article", articleService.read(articleNo));

        return "/article/modify_paging";
    }
    
    @RequestMapping(value = "/modifyPaging", method = RequestMethod.POST)
    public String modifyPOSTPaging(ArticleVO articleVO,
                                   Criteria criteria,
                                   RedirectAttributes redirectAttributes) throws Exception {

        logger.info("modifyPOSTPaging ...");
        articleService.update(articleVO);
        redirectAttributes.addAttribute("page", criteria.getPage());
        redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
        redirectAttributes.addFlashAttribute("msg", "modSuccess");

        return "redirect:/article/listPaging";
    }
    
    @RequestMapping(value = "/removePaging", method = RequestMethod.POST)
    public String removePaging(@RequestParam("articleNo") int articleNo,
                               Criteria criteria,
                               RedirectAttributes redirectAttributes) throws Exception {

        logger.info("remove ...");
        articleService.delete(articleNo);
        redirectAttributes.addAttribute("page", criteria.getPage());
        redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
        redirectAttributes.addFlashAttribute("msg", "delSuccess");

        return "redirect:/article/listPaging";
    }
    ///////// old version begin ////////
    @RequestMapping(value = "/article/listCriteria", method = RequestMethod.GET)
    public String listCriteria(Model model, Criteria criteria) throws Exception {
        logger.info("listCriteria ...");
        model.addAttribute("articles", articleService.listCriteria(criteria));
        return "/article/list_criteria";
    }
    
    // 등록 페이지 이동
    @RequestMapping(value = "/article/write", method = RequestMethod.GET)
    public String writeGET() {

        logger.info("write GET...");

        return "/article/write";
    }
    
    // 등록 처리
    @RequestMapping(value = "/article/write", method = RequestMethod.POST)
    public String writePOST(ArticleVO articleVO,
                            RedirectAttributes redirectAttributes) throws Exception {

        logger.info("write POST...");
        logger.info(articleVO.toString());
        articleService.create(articleVO);
        redirectAttributes.addFlashAttribute("msg", "regSuccess");

        return "redirect:/article/list";
    }
    
    // 목록 페이지 이동
    @RequestMapping(value = "/article/list", method = RequestMethod.GET)
    public String list(Model model) throws Exception {

        logger.info("list ...");
        model.addAttribute("articles", articleService.listAll());

        return "/article/list";
    }
    
 // 조회 페이지 이동
    @RequestMapping(value = "/article/read", method = RequestMethod.GET)
    public String read(@RequestParam("articleNo") int articleNo,
                       Model model) throws Exception {

        logger.info("read ...");
        model.addAttribute("article", articleService.read(articleNo));

        return "/article/read";
    }   

 // 수정 페이지 이동 
    @RequestMapping(value = "/article/modify", method = RequestMethod.GET)
    public String modifyGET(@RequestParam("articleNo") int articleNo,
                            Model model) throws Exception {

        logger.info("modifyGet ...");
        model.addAttribute("article", articleService.read(articleNo));

        return "/article/modify";
    }
 // 수정 처리
    @RequestMapping(value = "/article/modify", method = RequestMethod.POST)
    public String modifyPOST(ArticleVO articleVO,
                             RedirectAttributes redirectAttributes) throws Exception {

        logger.info("modifyPOST ...");
        articleService.update(articleVO);
        redirectAttributes.addFlashAttribute("msg", "modSuccess");

        return "redirect:/article/list";
    }  
    
 // 삭제 처리
    @RequestMapping(value = "/article/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("articleNo") int articleNo,
                         RedirectAttributes redirectAttributes) throws Exception {

        logger.info("remove ...");
        articleService.delete(articleNo);
        redirectAttributes.addFlashAttribute("msg", "delSuccess");

        return "redirect:/article/list";
    }    
}
