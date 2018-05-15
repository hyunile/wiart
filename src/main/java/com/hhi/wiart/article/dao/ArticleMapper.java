/**
 * 
 */
package com.hhi.wiart.article.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.hhi.wiart.article.model.ArticleVO;
import com.hhi.wiart.common.paging.Criteria;

/**
 * <PRE>
 * 1. ClassName: ArticleDAO
 * 2. FileName : ArticleDAO.java
 * 3. Package  : com.hhi.wiart.article.dao
 * 4. Comment  :
 * 5. 작성자   : hhi
 * 6. 작성일   : 2018. 5. 14.
 * 7. 변경이력
 *		이름	:	일자	    : 변경내용
 *     ———————————————————————————————————
 *		hhi :	2018. 5. 14.	: 신규 개발.
 * </PRE>
 */
@Component
public interface ArticleMapper {

    void create(ArticleVO articleVO);

    ArticleVO read(Integer articleNo);

    void update(ArticleVO articleVO);

    void delete(Integer articleNo);

    List<ArticleVO> listAll();
    
    List<ArticleVO> listPaging(int page);
    
    List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
}