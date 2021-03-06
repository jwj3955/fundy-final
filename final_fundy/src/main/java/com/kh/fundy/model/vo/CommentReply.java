package com.kh.fundy.model.vo;

import java.sql.Timestamp;

public class CommentReply {
	
	private int commentReplyNo;
	private int commentNo;
	private String memberEmail;
	private String commentReplyContent;
	private Timestamp commentReplyDate;
	private Timestamp commentReplyMod;
	private Timestamp commentReplyDelete;
	
	private String memberNick;
	private String memberProfile;
	
	public CommentReply() {}

	public CommentReply(int commentReplyNo, int commentNo, String memberEmail, String commentReplyContent,
			Timestamp commentReplyDate, Timestamp commentReplyMod, Timestamp commentReplyDelete, String memberNick,
			String memberProfile) {
		super();
		this.commentReplyNo = commentReplyNo;
		this.commentNo = commentNo;
		this.memberEmail = memberEmail;
		this.commentReplyContent = commentReplyContent;
		this.commentReplyDate = commentReplyDate;
		this.commentReplyMod = commentReplyMod;
		this.commentReplyDelete = commentReplyDelete;
		this.memberNick = memberNick;
		this.memberProfile = memberProfile;
	}

	public int getCommentReplyNo() {
		return commentReplyNo;
	}

	public void setCommentReplyNo(int commentReplyNo) {
		this.commentReplyNo = commentReplyNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getCommentReplyContent() {
		return commentReplyContent;
	}

	public void setCommentReplyContent(String commentReplyContent) {
		this.commentReplyContent = commentReplyContent;
	}

	public Timestamp getCommentReplyDate() {
		return commentReplyDate;
	}

	public void setCommentReplyDate(Timestamp commentReplyDate) {
		this.commentReplyDate = commentReplyDate;
	}

	public Timestamp getCommentReplyMod() {
		return commentReplyMod;
	}

	public void setCommentReplyMod(Timestamp commentReplyMod) {
		this.commentReplyMod = commentReplyMod;
	}

	public Timestamp getCommentReplyDelete() {
		return commentReplyDelete;
	}

	public void setCommentReplyDelete(Timestamp commentReplyDelete) {
		this.commentReplyDelete = commentReplyDelete;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getMemberProfile() {
		return memberProfile;
	}

	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	
}
