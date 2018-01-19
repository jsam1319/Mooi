package kr.co.mooi.keyword.util;

import java.util.ArrayList;

import kr.co.mooi.keyword.domain.Keyword;

/**
 * @packgename   kr.or.kosta.semicolon.keyword.util
 * @filename         HangulSeperator.java
 * @author          jaehyun
 * @since            2017. 11. 28.
 * @see					Keyword DB에 저장하기 위해 각 자모음 분리
 *
 * == Modification Infomation (수정 이력) ==
 * 
 *   DATE        AUTHOR       NOTE
 * --------      -----------   ---------------------------------------
 * 2017. 11. 28.      jaehyun         최초 생성
 *
 *
 */
public class HangulSeperator {

	/* (초성 * 21 * 28) + (중성 * 28) + 종성  -> ( (초성 * 21) + 중성 ) * 28 + 종성 */
	static String[] cho = new String[]{ "ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ" };
	static String[] jung = new String[]{ "ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ" };
	static String[] jong = new String[]{ "", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ","ㄿ", "ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ","ㅍ", "ㅎ" };
	
	
	public static String seperate(String hangul) {
		String str = "";
		
		

		for(int i=0; i<hangul.length(); i++) {
			if((int)'ㄱ' <=  hangul.charAt(i) && (int)'ㅎ' >= hangul.charAt(i)) {
				str = str + Character.toString(hangul.charAt(i));
				continue;
			}
			str = str + charSeperate(hangul.charAt(i));
		}
		
		return str;
	}
	
	private static String charSeperate(char ch) {
		
		/* 종성 -> 코드 % 28 -> r1
		 * 중성 -> r1 % 21 -> r2
		 * 초성 -> r2 / 21
		 */
		int code = ch - '가';
		int jongsung = code % 28;
		int jungsung = (code/28) % 21;
		int chosung = (code/28/21) % 28;
		String sepJong = "";
		
		if(jongsung != 0)
			sepJong = jsSeperate(jong[jongsung].charAt(0));
		
		return cho[chosung] + jung[jungsung] +  sepJong;
	}
	
	private static String jsSeperate(char jong) {
		switch(jong) {
		case 'ㄳ':
			return "ㄱ" + "ㅅ";
		case 'ㄵ':
			return "ㄴ" + "ㅈ";
		case 'ㄶ':
			return "ㄴ" + "ㅎ";
		case 'ㄺ':
			return "ㄹ" + "ㄱ";
		case 'ㄻ':
			return "ㄹ" + "ㅁ";
		case 'ㄼ':
			return "ㄹ" + "ㅂ";
		case 'ㄽ':
			return "ㄹ" + "ㅅ";
		case 'ㄾ':
			return "ㄹ" + "ㅌ";
		case 'ㄿ':
			return "ㄹ" + "ㅍ";
		case 'ㅀ':
			return "ㄹ" + "ㅎ";
		case 'ㅄ':
			return "ㅂ" + "ㅅ";
		default:
			return jong + "";
		}
	}
	
	private static char conJs(String conCh) {
		
		switch(conCh) {
		case "ㄱㅅ":
			return 'ㄳ';
		case "ㄴㅈ":
			return 'ㄵ';
		case "ㄴㅎ":
			return 'ㄶ';
		case "ㄹㄱ":
			return 'ㄺ';
		case "ㄹㅁ":
			return 'ㄻ';
		case "ㄹㅂ":
			return 'ㄼ';
		case "ㄹㅅ":
			return 'ㄽ';
		case "ㄹㅌ":
			return 'ㄾ';
		case "ㄹㅍ":
			return 'ㄿ';
		case "ㄹㅎ":
			return 'ㅀ';
		case "ㅂㅅ":
			return 'ㅄ';
		default:
			return conCh.charAt(0);
		}
	}
	
	public static String conHangul(String sep) {
		ArrayList<Character> stack = new ArrayList<Character>();
		String result = "";
		int tempCh = 0;
		boolean isStack = false;
		
		
		for(int i=0; i<sep.length(); i++) {
			
			/* 자음일 경우 */
			if((int)'ㄱ' <= sep.charAt(i) && (int)'ㅎ' >= sep.charAt(i) ) {
				
				if(stack.size() < 2) stack.add(sep.charAt(i));
				else {
					char ch1 = stack.get(0);
					char ch2 = stack.get(1);

					stack.clear();
					stack.add(conJs(Character.toString(ch1) + Character.toString(ch2)));
					stack.add(sep.charAt(i));
				}
			}

			else {
				if(stack.size() == 1) {
					if(isStack) {
						result = result + Character.toString((char)(tempCh + '가'));
						
						/* ( (초성 * 21) + 중성 ) * 28 + 종성 */
						char ch = stack.get(0);
						stack.clear();
						
						
						
						tempCh = ((getChoIdx(ch) * 21) + getJungIdx(sep.charAt(i))) * 28;
					}
					
					else {
						char ch = stack.get(0);
						
						tempCh = ((getChoIdx(ch) * 21) + getJungIdx(sep.charAt(i))) * 28;
						stack.clear();
						isStack = true;
					}
				}
				
				else {
					char jong = stack.get(0);
					char ch = stack.get(1);
					stack.clear();
					
					result = result + Character.toString((char)(tempCh + '가' + getJongIdx(jong)));
					tempCh = ((getChoIdx(ch) * 21) + getJungIdx(sep.charAt(i))) * 28;
	
				}
			}
		}
		if(stack.isEmpty()) {
			result = result + Character.toString((char)(tempCh + '가'));
		}
		
		else {
			result = result + Character.toString((char)(tempCh + '가' + getJongIdx(stack.get(0))));
		}
		
		return result;
	}
	
	private static int getChoIdx(char ch) {
		for(int i=0; i<cho.length; i++) {
			if(cho[i].charAt(0) == ch) return i;
		}
		
		return -1;
	}
	
	private static int getJungIdx(char ch) {
		for(int i=0; i<jung.length; i++) {
			if(jung[i].charAt(0) == ch) return i;
		}
		
		return -1;
	}
	
	private static int getJongIdx(char ch) {
//		System.out.println("ch : " + ch);
		
		for(int i=1; i<jong.length; i++) {
			if(jong[i].charAt(0) == ch) return i;
		}
		
		return -1;
	}
}
