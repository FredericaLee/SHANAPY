package Infor;


import java.util.*;
import java.text.SimpleDateFormat;


public class Dates {
	
	
	public Dates(){
		
	}
	public String get() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		return df.format(new Date());// new Date()为获取当前系统时间
		}
}
