package com.kh.user.board.model.vo;

public class PageInfo {

	private int currentPage;
	private int startPage;
	private int lastPage;
	private int maxPage;
	private String category;
	private String order;
	
	public PageInfo(int currentPage, String category, String order) {
		super();
		
		this.currentPage = currentPage;
		this.startPage = (currentPage % 10 == 0)? currentPage - 9:currentPage / 10 * 10 + 1;
		this.lastPage = (currentPage % 10 == 0)? currentPage:currentPage / 10 * 10 + 10;
		
		if(category == null || !(category.equals("1") || category.equals("2"))) {
			this.category = "all";
		} else {
			this.category = category;
		}
		
		if(order == null || !(order.equals("writer") || order.equals("count"))) {
			this.order = "date";
		} else {
			this.order = order;
		}
		
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
	
}
