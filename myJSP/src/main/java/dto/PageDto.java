package dto;

public class PageDto {

	int startNo; 		// 페이지 블럭 시작번호
	int endNo; 			// 페이지 블럭 끝 번호
	int realEnd;		// 게시물의 끝페이지 번호(<< 끝페이지로 이동 >>)
	boolean prev, next; // 이전, 다음 버튼(true이면 활성화)
	
	// 페이지 블럭을 생성하기 위해 필요한 요소	
	int total;			// 총 게시물의 수
	Criteria criteria;  // 페이지 번호, 페이지당 게시물 수
	
	
	public PageDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	public PageDto(int total, Criteria criteria) {
		super();
		this.total = total;
		this.criteria = criteria;
		
		// 페이지 블럭의 끝 번호 구하기
		// 7페이지 : 올림처리(7/10.0)*10 
		endNo = (int)(Math.ceil(criteria.pageNo/10.0)*10);
		startNo = endNo - (10-1); 
		
		//끝페이지 번호 
		realEnd = (int)(Math.ceil(total/(double)criteria.getAmount())); 
		
		// 페이지 블럭의 끝번호를 설정
		// 게시물의 끝페이지보다 큰 경우, 게시물의 끝페이지로 설정
		endNo = endNo>realEnd ? realEnd : endNo;
		
		// 앞으로 이동 / 뒤로 이동
		prev = startNo > 1 ? true : false;
		next = endNo==realEnd ? false : true;
	}



	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getRealEnd() {
		return realEnd;
	}

	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}

	
}
