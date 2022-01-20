package com.probada.user.vo;

import java.util.Date;

public class UploadTestVO {

	
	
	
	private String	name;
	private int	size;
	private String	path;
	private String	extension;
	private boolean	isDirectory;
	private String	hasDirectories;
	private String	created;
	private Date createdUtc = new Date();
	private String	modified;
	private String	modifiedUtc;
	private String filename;
	
	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "UploadTestVO [name=" + name + ", size=" + size + ", path=" + path + ", extension=" + extension
				+ ", isDirectory=" + isDirectory + ", hasDirectories=" + hasDirectories + ", created=" + created
				+ ", createdUtc=" + createdUtc + ", modified=" + modified + ", modifiedUtc=" + modifiedUtc + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public boolean isDirectory() {
		return isDirectory;
	}
	public void setDirectory(boolean isDirectory) {
		this.isDirectory = isDirectory;
	}
	public String getHasDirectories() {
		return hasDirectories;
	}
	public void setHasDirectories(String hasDirectories) {
		this.hasDirectories = hasDirectories;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public Date getCreatedUtc() {
		return createdUtc;
	}
	public void setCreatedUtc(Date createdUtc) {
		this.createdUtc = createdUtc;
	}
	public String getModified() {
		return modified;
	}
	public void setModified(String modified) {
		this.modified = modified;
	}
	public String getModifiedUtc() {
		return modifiedUtc;
	}
	public void setModifiedUtc(String modifiedUtc) {
		this.modifiedUtc = modifiedUtc;
	}
			
	
	
	
	
	
	
	
	
}
