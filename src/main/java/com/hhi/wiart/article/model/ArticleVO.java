/**
 * 
 */
package com.hhi.wiart.article.model;

import java.util.Date;

/**
 * <PRE>
 * 1. ClassName: ArticleVO
 * 2. FileName : ArticleVO.java
 * 3. Package  : com.hhi.wiart.article.model
 * 4. Comment  :
 * 5. 작성자   : hhi
 * 6. 작성일   : 2018. 5. 14.
 * 7. 변경이력
 *		이름	:	일자	    : 변경내용
 *     ———————————————————————————————————
 *		hhi :	2018. 5. 14.	: 신규 개발.
 * </PRE>
 */

public class ArticleVO {
	
    private Integer articleNo;

    private String title;

    private String content;

    private String writer;

    private Date regDate;

    private int viewCnt;

	public Integer getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(Integer articleNo) {
		this.articleNo = articleNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
}
