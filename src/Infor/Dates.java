package Infor;


import java.util.*;
import java.text.SimpleDateFormat;


public class Dates {
	
	
	public Dates(){
		
	}
	public String get() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//�������ڸ�ʽ
		return df.format(new Date());// new Date()Ϊ��ȡ��ǰϵͳʱ��
		}
}
