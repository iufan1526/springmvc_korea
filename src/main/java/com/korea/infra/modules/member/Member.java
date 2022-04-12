package com.korea.infra.modules.member;

import java.sql.Date;
import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	
// infrMember
	private String ifmmSeq;
	private Integer ifmmDelNy;
	private String ifmmName;
	private String ifmmId;
	private String ifmmPassword;
	private String ifcdName;
	private String ifmmDesc;
	private String ifmmGender;
	private String ifmmGenderCd;
	private String ifmmEngName;
	private Date ifmmDob;
	private LocalDateTime regDateTimeSvr;
	private String ifmmSavedCd;
	private String ifmmSaved;
	private String ifmeTelecomCd;
	private String ifmeTelecom;
	
//	infrMemberAddress
	private String ifmaTitle;
	private String ifmaAddress1;
	private String ifmaAddress2;
	private String ifmaZipcode;
	private String ifmaDelNy;
	private String ifmaDefaultNy;
	private String ifmaTypeCd;

// infrMemberEmail
	private String ifmeEmailFull;
	private String ifmeEmailAcount;
	private String ifmeEmailDomain;
	private String ifmeDefaultNy;
	private String ifmeDelNy;
	
// infrMemberPhone
	private String ifmeNumber;
	private String ifmpDefaultNy;
	private String ifmpDelNy;
	
//file
	
	private MultipartFile file;
	private MultipartFile file2;
	private String originalFileName;
	private String uuidFileName;
	
	
	
	
	public String getIfmmSeq() {
		return ifmmSeq;
	}
	public void setIfmmSeq(String ifmmSeq) {
		this.ifmmSeq = ifmmSeq;
	}
	public Integer getIfmmDelNy() {
		return ifmmDelNy;
	}
	public void setIfmmDelNy(Integer ifmmDelNy) {
		this.ifmmDelNy = ifmmDelNy;
	}
	public String getIfmmName() {
		return ifmmName;
	}
	public void setIfmmName(String ifmmName) {
		this.ifmmName = ifmmName;
	}
	public String getIfmmId() {
		return ifmmId;
	}
	public void setIfmmId(String ifmmId) {
		this.ifmmId = ifmmId;
	}
	public String getIfmmPassword() {
		return ifmmPassword;
	}
	public void setIfmmPassword(String ifmmPassword) {
		this.ifmmPassword = ifmmPassword;
	}
	public String getIfcdName() {
		return ifcdName;
	}
	public void setIfcdName(String ifcdName) {
		this.ifcdName = ifcdName;
	}
	public String getIfmmDesc() {
		return ifmmDesc;
	}
	public void setIfmmDesc(String ifmmDesc) {
		this.ifmmDesc = ifmmDesc;
	}
	public String getIfmmGender() {
		return ifmmGender;
	}
	public void setIfmmGender(String ifmmGender) {
		this.ifmmGender = ifmmGender;
	}
	public String getIfmmEngName() {
		return ifmmEngName;
	}
	public void setIfmmEngName(String ifmmEngName) {
		this.ifmmEngName = ifmmEngName;
	}
	public Date getIfmmDob() {
		return ifmmDob;
	}
	public void setIfmmDob(Date ifmmDob) {
		this.ifmmDob = ifmmDob;
	}
	public String getIfmaTitle() {
		return ifmaTitle;
	}
	public void setIfmaTitle(String ifmaTitle) {
		this.ifmaTitle = ifmaTitle;
	}
	public String getIfmaAddress1() {
		return ifmaAddress1;
	}
	public void setIfmaAddress1(String ifmaAddress1) {
		this.ifmaAddress1 = ifmaAddress1;
	}
	public String getIfmaAddress2() {
		return ifmaAddress2;
	}
	public void setIfmaAddress2(String ifmaAddress2) {
		this.ifmaAddress2 = ifmaAddress2;
	}
	public String getIfmaZipcode() {
		return ifmaZipcode;
	}
	public void setIfmaZipcode(String ifmaZipcode) {
		this.ifmaZipcode = ifmaZipcode;
	}
	public String getIfmaDelNy() {
		return ifmaDelNy;
	}
	public void setIfmaDelNy(String ifmaDelNy) {
		this.ifmaDelNy = ifmaDelNy;
	}
	public String getIfmaDefaultNy() {
		return ifmaDefaultNy;
	}
	public void setIfmaDefaultNy(String ifmaDefaultNy) {
		this.ifmaDefaultNy = ifmaDefaultNy;
	}
	public String getIfmeEmailFull() {
		return ifmeEmailFull;
	}
	public void setIfmeEmailFull(String ifmeEmailFull) {
		this.ifmeEmailFull = ifmeEmailFull;
	}
	public String getIfmeEmailAcount() {
		return ifmeEmailAcount;
	}
	public void setIfmeEmailAcount(String ifmeEmailAcount) {
		this.ifmeEmailAcount = ifmeEmailAcount;
	}
	public String getIfmeEmailDomain() {
		return ifmeEmailDomain;
	}
	public void setIfmeEmailDomain(String ifmeEmailDomain) {
		this.ifmeEmailDomain = ifmeEmailDomain;
	}
	public String getIfmeDefaultNy() {
		return ifmeDefaultNy;
	}
	public void setIfmeDefaultNy(String ifmeDefaultNy) {
		this.ifmeDefaultNy = ifmeDefaultNy;
	}
	public String getIfmeDelNy() {
		return ifmeDelNy;
	}
	public void setIfmeDelNy(String ifmeDelNy) {
		this.ifmeDelNy = ifmeDelNy;
	}
	public String getIfmeNumber() {
		return ifmeNumber;
	}
	public void setIfmeNumber(String ifmeNumber) {
		this.ifmeNumber = ifmeNumber;
	}
	public String getIfmpDefaultNy() {
		return ifmpDefaultNy;
	}
	public void setIfmpDefaultNy(String ifmpDefaultNy) {
		this.ifmpDefaultNy = ifmpDefaultNy;
	}
	public String getIfmpDelNy() {
		return ifmpDelNy;
	}
	public void setIfmpDelNy(String ifmpDelNy) {
		this.ifmpDelNy = ifmpDelNy;
	}
	public String getIfmaTypeCd() {
		return ifmaTypeCd;
	}
	public void setIfmaTypeCd(String ifmaTypeCd) {
		this.ifmaTypeCd = ifmaTypeCd;
	}
	public String getIfmmGenderCd() {
		return ifmmGenderCd;
	}
	public void setIfmmGenderCd(String ifmmGenderCd) {
		this.ifmmGenderCd = ifmmGenderCd;
	}
	public LocalDateTime getRegDateTimeSvr() {
		return regDateTimeSvr;
	}
	public void setRegDateTimeSvr(LocalDateTime regDateTimeSvr) {
		this.regDateTimeSvr = regDateTimeSvr;
	}
	public String getIfmmSavedCd() {
		return ifmmSavedCd;
	}
	public void setIfmmSavedCd(String ifmmSavedCd) {
		this.ifmmSavedCd = ifmmSavedCd;
	}
	public String getIfmmSaved() {
		return ifmmSaved;
	}
	public void setIfmmSaved(String ifmmSaved) {
		this.ifmmSaved = ifmmSaved;
	}
	public String getIfmeTelecomCd() {
		return ifmeTelecomCd;
	}
	public void setIfmeTelecomCd(String ifmeTelecomCd) {
		this.ifmeTelecomCd = ifmeTelecomCd;
	}
	public String getIfmeTelecom() {
		return ifmeTelecom;
	}
	public void setIfmeTelecom(String ifmeTelecom) {
		this.ifmeTelecom = ifmeTelecom;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getUuidFileName() {
		return uuidFileName;
	}
	public void setUuidFileName(String uuidFileName) {
		this.uuidFileName = uuidFileName;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	
	
	
	


	
	
	
	
	

	
	
}
