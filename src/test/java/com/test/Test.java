package com.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Test {
public static void main(String[] args) throws ParseException {
	String begintime="2016-01-05";
	String endtime="2016-01-07";
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");		
	Date begindate= sdf.parse(begintime);
	Date enddate= sdf.parse(endtime);
	Calendar begin=Calendar.getInstance();
	begin.setTime(begindate);
	Calendar end=Calendar.getInstance();
	end.setTime(enddate);
	int beginInt=begin.get(Calendar.DAY_OF_YEAR);
	int endInt=end.get(Calendar.DAY_OF_YEAR);
	Integer  daytime=endInt-beginInt;
	String day=daytime.toString();
	System.out.println(day);
}
}
