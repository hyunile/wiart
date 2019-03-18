/**
 * 
 */
package com.hhi.wiart.article.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hhi.wiart.article.dao.ArticleMapper;
import com.hhi.wiart.article.model.ArticleVO;
import com.hhi.wiart.common.paging.Criteria;

/**
 * <PRE>
 * 1. ClassName: ArticleServiceImpl
 * 2. FileName : ArticleServiceImpl.java
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

@Service
public class ArticleServiceImpl implements ArticleService {

	@Resource(name="articleMapper")
    private final ArticleMapper articleMapper;

    @Inject
    public ArticleServiceImpl(ArticleMapper articleMapper) {
        this.articleMapper = articleMapper;
    }

    @Override
    public void create(ArticleVO articleVO) throws Exception {
    	articleMapper.create(articleVO);
    }

    @Override
    public ArticleVO read(Integer articleNo) throws Exception {
        return articleMapper.read(articleNo);
    }

    @Override
    public void update(ArticleVO articleVO) throws Exception {
    	articleMapper.update(articleVO);
    }

    @Override
    public void delete(Integer articleNo) throws Exception {
    	articleMapper.delete(articleNo);
    }

    @Override
    public List<ArticleVO> listAll() throws Exception {
    	
    	System.out.println(" list in~~~~~~~~~~~~~ ");
        return articleMapper.listAll();
    }
    
    @Override
    public List<ArticleVO> listCriteria(Criteria criteria) throws Exception{
    	return articleMapper.listCriteria(criteria);
    }
    
    @Override
    public int countArticles(Criteria criteria) throws Exception {
        return articleMapper.countArticles(criteria);
    }
    
    @Override
    public List<ArticleVO> listPaging(int page) throws Exception{
    	// 0보다 작은 음수값 막음
    	if(page <= 0){
    		page = 1;
    	}
    	
    	page = (page - 1) * 10;
    	return articleMapper.listPaging(page);
    }
    
    @Override
    public void addFile(String fileName) throws Exception {
    	articleMapper.addFile(fileName);
    }
}