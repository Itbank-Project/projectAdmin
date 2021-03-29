package com.itbank.room;

import java.util.Date;

public class RoomDTO {

//	TABLE		   ROOM
//	RO_PK          NOT NULL VARCHAR2(50)        
//	RO_BADTYPE     NOT NULL VARCHAR2(50)  
//	RO_LIMITPERSON NOT NULL NUMBER        
//	RO_DESCRIPTION NOT NULL VARCHAR2(500) 
//	RO_UPLOADFILE  NOT NULL VARCHAR2(500) 
//	RO_HO_NAME     NOT NULL VARCHAR2(50)  
//	RO_ROOMTYPE    NOT NULL VARCHAR2(50) 

	private int ro_limitperson;
	private String ro_pk, ro_badtype, ro_description, ro_uploadfile, ro_ho_name, ro_roomtype;
	
	public int getRo_limitperson() {
		return ro_limitperson;
	}
	public void setRo_limitperson(int ro_limitperson) {
		this.ro_limitperson = ro_limitperson;
	}
	public String getRo_pk() {
		return ro_pk;
	}
	public void setRo_pk(String ro_pk) {
		this.ro_pk = ro_pk;
	}
	public String getRo_badtype() {
		return ro_badtype;
	}
	public void setRo_badtype(String ro_badtype) {
		this.ro_badtype = ro_badtype;
	}
	public String getRo_description() {
		return ro_description;
	}
	public void setRo_description(String ro_description) {
		this.ro_description = ro_description;
	}
	public String getRo_uploadfile() {
		return ro_uploadfile;
	}
	public void setRo_uploadfile(String ro_uploadfile) {
		this.ro_uploadfile = ro_uploadfile;
	}
	public String getRo_ho_name() {
		return ro_ho_name;
	}
	public void setRo_ho_name(String ro_ho_name) {
		this.ro_ho_name = ro_ho_name;
	}
	public String getRo_roomtype() {
		return ro_roomtype;
	}
	public void setRo_roomtype(String ro_roomtype) {
		this.ro_roomtype = ro_roomtype;
	}

}
