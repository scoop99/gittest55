package cmsUtil;

public class Util {
	//camel to underscore 변환 
	public static String camelNotation(String str) {
		String value = "";
		String[] strTemp = str.toLowerCase().split("_");
		
		for(int i=0;i<strTemp.length;i++) {
			if(i==0) {
				value = strTemp[i];
			}
			else {
				value += strTemp[i].substring(0,1).toUpperCase()+strTemp[i].substring(1, strTemp[i].length());
			}
		}
		return value;
	}
	
	// underscore  to  camel 변환 
	public static String underscoreCamel(String str) {
		String regex = "([a-z])([A-Z])";
		String replacement = "$1_$2";
        String value = "";        
        value = str.replaceAll(regex, replacement).toUpperCase();
        return value;
	}
	
	

}
