package com.spring.flower.dto;

public class BPageVO {
	private int pageDataCount;//한 목록 화면에 보여줄 게시글 수
	private int currentPageNum;//현재 선택된 페이지 번호
	private int totalDataCount;//전체 데이터 갯수
	private int pageSize; // 한화면에 보여줄 페이지 갯수
	// << < 1 2 3 4 5 6 7 8 9 10 > >>
	
	private int firstPageNum; //전체 페이지의 첫번째페이지
	private int lastPageNum;  //전체 페이지의 마지막페이지
	private int prevPageNum;  // 이전 페이지 번호
	private int nextPageNum;  // 다음 페이지번호
	private int startPageNum; // 한 화면에 페이징의 시작 페이지번호
	private int endPageNum;	  // 한 화면에 페이징의 마지막 페이지 번호
	
	@Override
	public String toString() {
		return "BPageVO [pageDataCount=" + pageDataCount + ", currentPageNum=" + currentPageNum + ", totalDataCount="
				+ totalDataCount + ", pageSize=" + pageSize + ", firstPageNum=" + firstPageNum + ", lastPageNum="
				+ lastPageNum + ", prevPageNum=" + prevPageNum + ", nextPageNum=" + nextPageNum + ", startPageNum="
				+ startPageNum + ", endPageNum=" + endPageNum + "]";
	}
	public BPageVO() {
	}
	
	// 페이지 변경시 불러오는 메소드
	//prevPageNum =-10 , nextPageNum =+ 10, 
	public void makePage(int page, int pageDataCount, int totalDataCount) {
		
		if(totalDataCount==0)return;
		this.totalDataCount = totalDataCount;
		this.currentPageNum = page;		//현재 페이지 번호
		this.pageDataCount = pageDataCount;
		
		this.pageSize = 10;
		this.firstPageNum = 1;
		this.lastPageNum = (totalDataCount-1)/pageDataCount+1;
		// 1~10 -> 1	11~20 -> 11
		this.startPageNum=((this.currentPageNum-1)/this.pageSize)*10+1;
		// 1~10 -> 10	11~20 -> 20
		this.endPageNum=this.startPageNum+9;
		
		if(this.endPageNum > this.lastPageNum) {
			this.endPageNum = this.lastPageNum;
		}
		this.prevPageNum = this.startPageNum-this.pageSize;
		if(this.prevPageNum < 1) {
			this.prevPageNum = 1;
		}
		this.nextPageNum = this.endPageNum+this.pageSize;
		if(this.nextPageNum > this.lastPageNum) {
			this.nextPageNum = this.lastPageNum;
		}
	}

	public int getPageDataCount() {
		return pageDataCount;
	}

	public void setPageDataCount(int pageDataCount) {
		this.pageDataCount = pageDataCount;
	}

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}

	public int getTotalDataCount() {
		return totalDataCount;
	}

	public void setTotalDataCount(int totalDataCount) {
		this.totalDataCount = totalDataCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstPageNum() {
		return firstPageNum;
	}

	public void setFirstPageNum(int firstPageNum) {
		this.firstPageNum = firstPageNum;
	}

	public int getLastPageNum() {
		return lastPageNum;
	}

	public void setLastPageNum(int lastPageNum) {
		this.lastPageNum = lastPageNum;
	}

	public int getPrevPageNum() {
		return prevPageNum;
	}

	public void setPrevPageNum(int prevPageNum) {
		this.prevPageNum = prevPageNum;
	}

	public int getNextPageNum() {
		return nextPageNum;
	}

	public void setNextPageNum(int nextPageNum) {
		this.nextPageNum = nextPageNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	
	
	
}
