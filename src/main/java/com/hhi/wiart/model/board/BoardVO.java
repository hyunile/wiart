package com.hhi.wiart.model.board;

import java.util.Date;
import com.thoughtworks.xstream.annotations.XStreamAlias;

@XStreamAlias("boardVO")
public class BoardVO {
	
	/*게시글 번호*/
	private int boardNo;   //게시글 번호
	
	private int boardPno;  //게시글 원글 번호
	
	private int boardDepth; //답글 깊이
	
	private String userId; //작성자ID
	
	private String userName; //작성자이름
	
	private String title; //제목
	
	private String content; //내용
	
	private int hit; //조회수
	
	private Date regDate; //작성날짜

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardPno() {
		return boardPno;
	}

	public void setBoardPno(int boardPno) {
		this.boardPno = boardPno;
	}

	public int getBoardDepth() {
		return boardDepth;
	}

	public void setBoardDepth(int boardDepth) {
		this.boardDepth = boardDepth;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
