package com.korea.infra.common.util;

import java.lang.invoke.ConstantCallSite;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.korea.infra.common.constants.Constant;
import com.mysql.cj.Constants;


public class UtilDateTime {
	
	
	public static LocalDateTime nowLocalDateTime () throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		return localDateTime;
	}
	

	public static Date nowDate () throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern(Constant.DATETIME_FORMAT_BASIC));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(Constant.DATETIME_FORMAT_BASIC);
        Date date = (Date) simpleDateFormat.parse(localDateTimeString);
		return date;
	}
	
	
	public static String nowString () throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern(Constant.DATETIME_FORMAT_BASIC));
		return localDateTimeString;
	}
	
	
	public static String calculateDayString (LocalDateTime localDateTime, int day) throws Exception {
		LocalDateTime localDateTimeNew;
		
		if(day >= 0) {
			localDateTimeNew = localDateTime.plusDays(day); 
		} else {
			localDateTimeNew = localDateTime.minusDays(Math.abs(day));
		}

		String localDateTimeNewString = localDateTimeNew.format(DateTimeFormatter.ofPattern(Constant.DATETIME_FORMAT_BASIC));
		return localDateTimeNewString;
	}
	
	
	public static LocalDateTime calculateDayLocalDateTime (LocalDateTime localDateTime, int day) throws Exception {
		LocalDateTime localDateTimeNew;
		
		if(day >= 0) {
			localDateTimeNew = localDateTime.plusDays(Math.abs(day)); 
		} else {
			localDateTimeNew = localDateTime.minusDays(Math.abs(day));
		}
		
		return localDateTimeNew;
	}
	
	
	public static Date calculateDayDate (LocalDateTime localDateTime, int day) throws Exception {
		LocalDateTime localDateTimeNew;
		
		if(day >= 0) {
			localDateTimeNew = localDateTime.plusDays(Math.abs(day)); 
		} else {
			localDateTimeNew = localDateTime.minusDays(Math.abs(day));
		}
		
		String localDateTimeNewString = localDateTimeNew.format(DateTimeFormatter.ofPattern(Constant.DATETIME_FORMAT_BASIC));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(Constant.DATETIME_FORMAT_BASIC);
        Date date = (Date) simpleDateFormat.parse(localDateTimeNewString);
		
		return date;
	}
	
	
	public static String addNowTimeString(String date) {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern(Constant.TIME_FORMAT_BASIC));
		return date + " " + localDateTimeString;
	}
	
	
	public static String add00TimeString(String date) {
		return date + " 00:00:00";
	}
	
}