package com.spring.flower.dto;


import java.sql.Timestamp;

public class AskVO {

	private String id;
	private String q_title;
	private String q_contents;
	private Timestamp q_date;
	private String q_category;
	private String reply;
	private String replyornot;
	private int pNum;
	private String q_image;
	private int qNum;
	
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_contents() {
		return q_contents;
	}
	public void setQ_contents(String q_contents) {
		this.q_contents = q_contents;
	}
	public Timestamp getQ_date() {
		return q_date;
	}
	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}
	public String getQ_category() {
		return q_category;
	}
	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReplyornot() {
		return replyornot;
	}
	public void setReplyornot(String replyornot) {
		this.replyornot = replyornot;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getQ_image() {
		return q_image;
	}
	public void setQ_image(String q_image) {
		this.q_image = q_image;
	}
	public int getqNum() {
		return qNum;
	}
	public void setqNum(int qNum) {
		this.qNum = qNum;
	}
	
	
}
