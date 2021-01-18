package product.bean;

import org.springframework.stereotype.Component;

import lombok.Data;
/*
 * 상품 관련 페이징 정보 관리 클래스
 */
@Component
@Data
public class ProductPaging {
	private int currentPage; // 현재
	private int pageBlock;  // 마지막
	private int pageSize;  // 크기
	private int totalA;  // 총
	
	private StringBuffer pagingHTML;  // 페이징관련 HTML
	
	
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalA() {
		return totalA;
	}

	public void setTotalA(int totalA) {
		this.totalA = totalA;
	}

	public StringBuffer getPagingHTML() {
		return pagingHTML;
	}

	public void setPagingHTML(StringBuffer pagingHTML) {
		this.pagingHTML = pagingHTML;
	}

	public void makePagingHTML(){
			
		int totalP = (totalA+pageSize-1)/pageSize;  // 총
			  	           //             /  하단 페이지 ex) 1~5   
		int startPage = (currentPage-1)/pageBlock*pageBlock+1; // 현재페이지 / 마지막
		
		int endPage = startPage+pageBlock-1; // 마지막

			pagingHTML = new StringBuffer();  
			//String 클래스의 인스턴스는 한 번 생성되면 그 값을 읽기만 할 수 있고, 변경할 수는 없습니다.
			//하지만 StringBuffer 클래스의 인스턴스는 그 값을 변경할 수도 있고, 추가할 수도 있습니다.
			//이를 위해 StringBuffer 클래스는 내부적으로 버퍼(buffer)라고 하는 독립적인 공간을 가집니다.
		
		if(endPage > totalP) endPage = totalP;
				
		
		if(startPage>pageBlock)	pagingHTML.append
		("<a href='#' id='paging' onclick='productPaging("+(startPage-1)+")'>"
				+ "<img src='http://img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif'></a>");     
		
		//   블록 개수보다 많아지면 이전 
		for(int i=startPage; i<=endPage; i++){
			// 끝페이지까지 반복
			if(i==currentPage) pagingHTML.append
			("<ol><li class='pagings' style='list-style:none;'><a class='page-link' id='currentPaging' href='#' onclick='productPaging("+i+")'>"+i+"</a></li>");
				// 현재 페이지 
			else pagingHTML.append
			("<li class='pagings' style='list-style:none;'><a id='paging' href='#' onclick='productPaging("+i+")'>"+i+"</a></li></ol>");}
		
		if(endPage < totalP) pagingHTML.append
		("<a href='#' id='paging' onclick='productPaging("+(endPage+1)+")'>");
		pagingHTML.append("<img src=http://img.echosting.cafe24.com/skin/base/common/btn_page_next.gif></a>");}
		
		
	
	public void makeSearchPagingHTML(){
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;

			pagingHTML = new StringBuffer();
			
		if(endPage > totalP) endPage = totalP;

		if(startPage>pageBlock)	pagingHTML.append("<li class='page-item' ><a class='page-link' id='paging' onclick='productSearchPaging("+(startPage-1)+")'>이전</a></li>");     
		
		for(int i=startPage; i<=endPage; i++){
			if(i==currentPage) pagingHTML.append("<li class='page-item'><a class='page-link' id='currentPaging' onclick='productSearchPaging("+i+")'>"+i+"</a></li>");
			else pagingHTML.append("<li class='page-item'><a class='page-link' id='paging' onclick='productSearchPaging("+i+")'>"+i+"</a></li>");}
		
		if(endPage < totalP) pagingHTML.append("<li class='page-item'><a class='page-link' id='paging' onclick='productSearchPaging("+(endPage+1)+")'>다음</a></li>");}
	
}	
	

