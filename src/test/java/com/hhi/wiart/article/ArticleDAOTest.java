/**
 * 
 */
package com.hhi.wiart.article;

/**
 * <PRE>
 * 1. ClassName: ArticleDAOTest
 * 2. FileName : ArticleDAOTest.java
 * 3. Package  : article
 * 4. Comment  :
 * 5. 작성자   : hhi
 * 6. 작성일   : 2018. 5. 15.
 * 7. 변경이력
 *		이름	:	일자	    : 변경내용
 *     ———————————————————————————————————
 *		hhi :	2018. 5. 15.	: 신규 개발.
 * </PRE>
 */

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/config/applicationContext.xml"})
public class ArticleDAOTest {
//
//    private static final Logger logger = LoggerFactory.getLogger(ArticleDAOTest.class);
//
//    @Inject
//    private ArticleMapper articleMapper;
//    
//    @Test
//    public void testListCriteria() throws Exception {
//        Criteria criteria = new Criteria();
//        criteria.setPage(3);
//        criteria.setPerPageNum(20);
//
//        List<ArticleVO> articles = articleMapper.listCriteria(criteria);
//
//        for (ArticleVO article : articles) {
//            logger.info(article.getArticleNo() + " : " + article.getTitle());
//        }
//    }
//    
/*    
    @Test
    public void testListPaging() throws Exception {
    	
    	int page = 3;
    	
    	List<ArticleVO> articles = articleMapper.listPaging(page);
    	
    	for (ArticleVO article : articles) {
    		logger.info(article.getArticleNo() + ":" + article.getTitle());
    	}
    }
    */
/*
    @Test
    public void testCreate() throws Exception {

	    for (int i = 1; i <= 1000; i++) {
	        ArticleVO articleVO = new ArticleVO();
	        articleVO.setTitle(i+ "번째 글 제목입니다...");
	        articleVO.setContent(i+ "번재 글 내용입니다...");
	        articleVO.setWriter("user0"+(i%10));
	        articleMapper.create(articleVO);
	    }

    }
    
    @Test
    public void testRead() throws Exception {
        logger.info(articleMapper.read(1).toString());
    }

    @Test
    public void testUpdate() throws Exception {
        ArticleVO article = new ArticleVO();
        article.setArticleNo(1);
        article.setTitle("글 수정 테스트 제목");
        article.setContent("글 수정 테스트 내용");
        articleMapper.update(article);
    }

    @Test
    public void testDelete() throws Exception {
    	articleMapper.delete(1);
    }
    */
}