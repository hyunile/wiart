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

    private int page; // 현재 페이지 번
    private int perPageNum; // 페이지 당 출력되는 게시글의 갯

    //기본생성자, 현재페이지를 1, 페이지 당 출력할 게시글의 갯수를 10으로 기본 세
    public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }

    // set method : 음수와 같은 잘못된 값이 들어오지 않도록 validation체크를 통해 적절한 값으로 세팅
    // get method : SQL Mapper가 사용할 get 메서드를 정의
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
    
    // 가장주목해서 봐야할 getPageStart() SQL Mapper의 LIMIT구문에서 현재 페이지의 게시글의 시작위치를 지정할때 사용한다.
    // 예를 들어 10개씩 출력할 경우, 3페이지는 SQL이 LIMIT 20, 10 과 같은 형태가 되어야 한다. 애래는 20을 얻기 위한 계산 공식이다.
    // 현재 페이지의 시작 게시글 번호 = (현재 페이지 번호 - 1) * 페이지 당 출력할 게시글의 갯수
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
