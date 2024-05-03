package com.mycompany.Tget_mini_web.dto;


import java.sql.Blob;

import lombok.Data;

@Data
public class Actor {
	private String aprofile;
	private String aname;
	private String arolename;
	private Blob aimg;
	private int pno; 
}
