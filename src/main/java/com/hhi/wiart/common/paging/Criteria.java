/**
 * 
 */
package com.hhi.wiart.common.paging;

/**
 * <PRE>
 * 1. ClassName: Criteria
 * 2. FileName : Criteria.java
 * 3. Package  : com.hhi.wiart.common.paging
 * 4. Comment  :
 * 5. 작성자   : hhi
 * 6. 작성일   : 2018. 5. 15.
 * 7. 변경이력
 *		이름	:	일자	    : 변경내용
 *     ———————————————————————————————————
 *		hhi :	2018. 5. 15.	: 신규 개발.
 * </PRE>
 */

public class Criteria {

    private int page;
    private int perPageNum;

    public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }

    public void setPage(int page) {

        if (page <= 0) {
            this.page = 1;
            return;
        }

        this.page = page;
    }

    public int getPage() {
        return page;
    }

    public void setPerPageNum(int perPageNum) {

        if (perPageNum <= 0 || perPageNum > 100) {
            this.perPageNum = 10;
            return;
        }

        this.perPageNum = perPageNum;
    }

    public int getPerPageNum() {
        return this.perPageNum;
    }

    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }

    @Override
    public String toString() {
        return "Criteria{" +
                "page=" + page +
                ", perPageNum=" + perPageNum +
                '}';
    }
	
}
