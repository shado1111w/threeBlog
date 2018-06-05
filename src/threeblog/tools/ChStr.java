package threeblog.tools;

import java.text.ParseException;

public class ChStr {

	public String chStr(String str) {      //返回中文字符�?
		if (str == null) {
			str = "";
		} else {
			try {
				//str = (new String(str.getBytes("iso-8859-1"), "GBK")).trim();   //�?
				str = (new String(str.getBytes("iso-8859-1"), "utf-8")).trim();   //0k   解决了中文乱�?
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}
		return str;
	}

	public String convertStr(String str1) {
		if (str1 == null) {
			str1 = "";
		} else {
			try {
				str1 = str1.replaceAll("<", "&lt;");
				str1 = str1.replaceAll(">", "&gt;");
				str1 = str1.replaceAll(" ", "&nbsp;");
				str1 = str1.replaceAll("\r\n", "<br>");
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}
		return str1;
	}
	
	
}
