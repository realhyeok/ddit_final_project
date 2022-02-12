package com.probada.totalSearch.vo;

public class SearchProjVO {

	
	
	private String projNo;
	private String title;
	private String privacy;
	private String plId;
	
	
	
	public String getProjNo() {
		return projNo;
	}
	public void setProjNo(String projNo) {
		this.projNo = projNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrivacy() {
		return privacy;
	}
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
	public String getPlId() {
		return plId;
	}
	public void setPlId(String plId) {
		this.plId = plId;
	}
	
	@Override
	public String toString() {
		return "SearchProjVO [proj_no=" + projNo + ", title=" + title + ", privacy=" + privacy + ", plId=" + plId
				+ "]";
	}
	

	
}
