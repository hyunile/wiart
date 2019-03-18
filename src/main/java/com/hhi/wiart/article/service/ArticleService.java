/**
 * 
 */
package com.hhi.wiart.article.service;

import java.util.List;

import com.hhi.wiart.article.model.ArticleVO;
import com.hhi.wiart.common.paging.Criteria;

/**
 * <PRE>
 * 1. ClassName: ArticleService
 * 2. FileName : ArticleService.java
 * 3. Package  : com.hhi.wiart.article.service
 * 4. Comment  :
 * 5. 작성자   : hhi
 * 6. 작성일   : 2018. 5. 14.
 * 7. 변경이력
 *		이름	:	일자	    : 변경내용
 *     ———————————————————————————————————
 *		hhi :	2018. 5. 14.	: 신규 개발.
 * </PRE>
 */

public interface ArticleService {

    void create(ArticleVO articleVO) throws Exception;

    ArticleVO read(Integer articleNo) throws Exception;

    void update(ArticleVO articleVO) throws Exception;

    void delete(Integer articleNo) throws Exception;

    List<ArticleVO> listAll() throws Exception;

    List<ArticleVO> listPaging(int page) throws Exception;
    
    List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
    
   void addFile(String fullName) throws Exception;
   
   public int countArticles(Criteria criteria) throws Exception;
}