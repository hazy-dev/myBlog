package com.study.blog.util;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CommonUtils {
	public static Gson gson;
    
    public static String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    public static Gson getGson() {
		if(gson == null) {
			try {
				gson = new Gson();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return gson;
	}
    
    // json등을 직접 출력하기 위해 response의 output을 직접 컨트롤한다. 
 	public static ModelAndView directWrite(HttpServletResponse res, String str) throws Exception {
 		res.setHeader("Content-Type", "text/plain;charset=UTF-8");
 		PrintWriter pw = res.getWriter();
 		pw.print(str);
 		pw.close();
 		return null;
 	}
 	
	/*
	 * public static String NtoS(String str) { if (str == null) return ""; return
	 * str.trim(); }
	 * 
	 * public static String NtoDefault(String str1, String str2) { if (str1 ==
	 * null){ if(str2 != null) return str2; else return ""; }
	 * 
	 * return str1.trim(); }
	 * 
	 * public static int NtoI(String str) { if (str == null || str.equals(""))
	 * return 0;
	 * 
	 * return Integer.parseInt(str); }
	 */
    
    public static float NtoF(String str) {
        if (str == null || str.equals(""))
            return 0;
        else {
        	/*
        	double tmp = Double.parseDouble(str);
        	Math.floor((tmp/100)*100.0);
        	//System.out.println("=================" +  str);
        	//System.out.println("변환======================================"+Math.round(tmp*10)/10.0);
        	double v = Math.round(tmp*10)/10.0; 
        	System.out.println("변환======================================"+v);
        	//String num = String.format("%.1f", Float.parseFloat(str));
        	
       // 	System.out.println("=================" +  num);
       // 	System.out.println("Float.parseFloat=================" +  Float.parseFloat(num));
         */
        
        	return Float.parseFloat(str);
        }
    }
    
    public static String getDate(String pattern){
    	if(pattern != null){
	    	java.text.SimpleDateFormat format = new java.text.SimpleDateFormat(pattern);
	    	return format.format(new Date());
    	} else {
    		return new Date().toString();
    	}
    }
    
   public static String getDate(String pattern, Date date){
    	if(date == null)
    		return "";
    	
    	if(pattern != null){
	    	java.text.SimpleDateFormat format = new java.text.SimpleDateFormat(pattern);
	    	return format.format(date);
    	} else {
    		return new Date().toString();
    	}
    }
   
	/*
	 * public static void printRequestParam(Map<String, Object> paramMap) {
	 * log.debug("=======================================================");
	 * 
	 * try {
	 * 
	 * Iterator<String> iterator = paramMap.keySet().iterator(); while
	 * (iterator.hasNext()) { String key = (String) iterator.next();
	 * if(paramMap.get(key) != null) {
	 * log.debug("key="+key+", value="+paramMap.get(key).toString()); } else {
	 * log.debug("key="+key+", value="+paramMap.get(key)); } } }catch (Exception e)
	 * { e.printStackTrace(); }
	 * log.debug("======================================================"); }
	 */
   
	public static String filter(String value) {
		if (value == null) {
			return null;
		}
		StringBuffer result = new StringBuffer(value.length());
		for (int i = 0; i < value.length(); ++i) {
			switch (value.charAt(i)) {
			case '<':
				result.append("&lt;");
				break;
			case '>':
				result.append("&gt;");
				break;
			case '"':
				result.append("&quot;");
				break;
			case '\'':
				result.append("&#39;");
				break;
			case '%':
				result.append("&#37;");
				break;
			case ';':
				result.append("&#59;");
				break;
			case '(':
				result.append("&#40;");
				break;
			case ')':
				result.append("&#41;");
				break;
			case '&':
				result.append("&amp;");
				break;
			case '+':
				result.append("&#43;");
				break;
			default:
				result.append(value.charAt(i));
				break;
			}
		}
		return result.toString();
	}
	
}