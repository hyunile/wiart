package com.hhi.wiart.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 날짜 유틸.
 * 
 * @author someone
 * @version 1.0.0
 */
public final class DateUtil {
	
	/**
	 * 로그 출력.
	 */
	static Logger l = LoggerFactory.getLogger(DateUtil.class);
	
	/**
	 * 10자리 문자열로 되어 있는 시간 값을 1주일이 지나지 않았다면, 몇초전/몇분전/몇일전으로 표시해 주고 1주일이 지났다면,
	 * yyyy.MM.dd hh:mm 포맷으로 리턴.
	 * 
	 * @param writtenTime 입력시간
	 * @return String
	 */
	public static String elapsedTime(String writtenTime) {
		if (writtenTime == null || writtenTime.trim().isEmpty()) {
			return "";
		}
		long writtenL = Long.parseLong(writtenTime) * 1000;

		Calendar writtenAdd7 = Calendar.getInstance();
		writtenAdd7.setTimeInMillis(writtenL);
		writtenAdd7.add(Calendar.DAY_OF_MONTH, 7);

		Calendar currCal = Calendar.getInstance();
		currCal.setTimeInMillis(System.currentTimeMillis());

		int compare = currCal.compareTo(writtenAdd7);
		String result = "";
		if (compare < 0) {
			// 1주일이 안 지났음.
			long currTimeL = currCal.getTimeInMillis();
			long diffL = (currTimeL - writtenL) / 1000;

			int diff = (int) diffL;

			if (diff < 60) {
				// 초로 리턴
				result = diff + "초전";
			} else if (diff < 3600) {
				// 분으로 리턴
				diff = diff / 60;
				result = diff + "분전";
			} else if (diff < 86400) {
				// 시간으로 리턴
				diff = diff / 3600;
				result = diff + "시간전";
			} else {
				diff = diff / 86400;
				// 일자로 리턴.
				result = diff + "일전";
			}

		} else {
			// 1주일이 지났음.
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy.MM.dd hh:mm");
			result = formatter.format(new Date(writtenL));
		}

		return result;

	}

	/**
	 * unix 타입의 시간을 변환해준다.
	 * 
	 * @param writtenTime unix타입 입력 값
	 * @return String
	 */
	public static String getTime(String writtenTime) {
		if (writtenTime == null || writtenTime.trim().isEmpty()) {
			return "";
		}
		long writtenL = Long.parseLong(writtenTime) * 1000;

		String result = "";

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd  a hh:mm");
		result = formatter.format(new Date(writtenL));

		return result;

	}
	
	/**
	 *	현재시간. 
	 *  
	 *  @return String
	 *  @param pattern 변경필요 패턴
	 */
	public static String getNow(String pattern) {
		if (pattern == null || pattern.trim().isEmpty()) {
			pattern = "yyyy-MM-dd HH:mm:ss";
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		
		return sdf.format(new Date());
	}
	
	/**
	 * 주어진 origin String에서 word에 해당하는 단어를 삭제한다.
	 *
	 * @param ori
	 * @param word
	 * @return
	 */
	public static final String removeWord(String ori, String word) {
		StringTokenizer stringtokenizer = new StringTokenizer(ori, word);
		StringBuffer stringbuffer = new StringBuffer();
		for (; stringtokenizer.hasMoreTokens(); stringbuffer.append(stringtokenizer.nextToken()));
		return stringbuffer.toString();
	}// end of removeWord();
	
	/**
	 * 주어진 original date로부터 move개월만큼 지난 날의 날짜를 구한다.
	 *
	 * @param ori
	 * @param move
	 *            이동한 개월 수. 전이면 마이너스로 입력.
	 * @param sep
	 *            년월일 사이에 들어갈 구분자.
	 * @return
	 */
	public static final String getNextMonth(String ori, int move) {
		return getNextMonth(ori, move, "");
	}// end of getNextMonth();
	
	/**
	 * 주어진 original date로부터 move개월만큼 지난 날의 날짜를 구한다.
	 *
	 * @param ori
	 * @param move
	 *            이동한 개월 수. 전이면 마이너스로 입력.
	 * @param sep
	 *            년월일 사이에 들어갈 구분자.
	 * @return
	 */
	public static final String getNextMonth(String ori, int move, String sep) {
		if (ori.length() < 8)
			return ori;
		String odate = removeWord(ori, sep);
		Calendar cal = Calendar.getInstance();
		String syear = odate.substring(0, 4);
		String smon = odate.substring(4, 6);
		String sdate = odate.substring(6, 8);
		int iyear = 0, imon = 0, idate = 0;
		try {
			iyear = Integer.parseInt(syear);
			imon = Integer.parseInt(smon);
			idate = Integer.parseInt(sdate);
		} catch (Exception e) {
			return ori;
		}
		cal.set(iyear, imon - 1 + move, idate);
		int yy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH) + 1;
		int dd = cal.get(Calendar.DATE);
		StringBuffer result = new StringBuffer().append(yy).append(sep);
		if (mm < 10)
			result.append(0).append(mm).append(sep);
		else
			result.append(mm).append(sep);
		if (dd < 10)
			result.append(0).append(dd);
		else
			result.append(dd);
		return result.toString();
	}// end of getNextMonth();
	
	
	/**
	 * return add day to date strings.
	 * 
	 * @param s string
	 * @param day 더할 일수
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 일수 더하기
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: ParseException 발생
	 */
    public static String addDays(String s, int day) {
        return addDays(s, day, "yyyy-MM-dd");
    }

	/**
	 * return add day to date strings with user defined format.
	 * @param s string
	 * @param day 더할 일수
	 * @param format string representation of the date format. For example, "yyyy-MM-dd".
	 * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 일수 더하기
	 *           형식이 잘못 되었거나 존재하지 않는 날짜: null return
	 */
    public static String addDays(String s, int day, String format){
    	try{
	 		SimpleDateFormat formatter =
			    new SimpleDateFormat (format);
			Date date = check(s, format);
	
	        date.setTime(date.getTime() + ((long)day * 1000 * 60 * 60 * 24));
	        return formatter.format(date);
    	}catch(ParseException pe){
    		l.error("{}",pe);
    		
    		return null;
    	}
    }
    
	/**
	 * check date string validation with the default format "yyyyMMdd".
	 * @param s date string you want to check with default format "yyyyMMdd".
     * @return date Date
	 */
	public static Date check(String s) {
		try{
			return check(s, "yyyy-MM-dd");
		}catch(ParseException pe){
			l.error("{}",pe);
			
			return null;
		}
	}
	
	/**
	 * check date string validation with an user defined format.
	 * @param s date string you want to check.
	 * @param format string representation of the date format. For example, "yyyy-MM-dd".
     * @return date Date
     * @throws ParseException 변환오류
	 */
	public static Date check(String s, String format) throws ParseException {
		if ( s == null )
			throw new ParseException("date string to check is null", 0);
		if ( format == null )
			throw new ParseException("format string to check date is null", 0);

		SimpleDateFormat formatter = new SimpleDateFormat (format);
		Date date = null;
		try {
			date = formatter.parse(s);
		}
		catch(ParseException e) {
            throw new ParseException(" wrong date:\"" + s +
            "\" with format \"" + format + "\"", 0);
		}

		if ( ! formatter.format(date).equals(s) )
			throw new ParseException(
				"Out of bound date:\"" + s + "\" with format \"" + format + "\"",0			);
        return date;
	}
	
	
	/**
	 * yyyyMMdd 형태의 문자열을 yyyy-MM-dd로 변환.
	 *
	 * @param yyyyMMdd 입력문자열
	 * @return String
	 */
	public static String getDateFormat(final String yyyyMMdd) {
		SimpleDateFormat df1 = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");

		String ret = "";

		if (yyyyMMdd == null || yyyyMMdd.length() != 8){
			return "";
		}else{
			try {
				ret = df2.format(df1.parse(yyyyMMdd));
			} catch (ParseException e) {
				l.error("error", e);
			}
		}

		return ret;
	}

	/**
	 * HHmmss 형태의 문자열을 HH:mm:ss 형태로 변환.
	 *
	 * @param HHmmss 입력문자열
	 * @return String
	 */
	public static String getTimeFormat(final String HHmmss) {
		SimpleDateFormat df1 = new SimpleDateFormat("HHmmss");
		SimpleDateFormat df2 = new SimpleDateFormat("HH:mm:ss");

		String ret = "";

		if (HHmmss == null || HHmmss.length() != 6){
			return "";
		}else{
			try {
				ret = df2.format(df1.parse(HHmmss));
			} catch (ParseException e) {
				l.error("error", e);
			}
		}

		return ret;
	}
}
