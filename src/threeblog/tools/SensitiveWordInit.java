package threeblog.tools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.*;

/**
 * @Description: ��ʼ�����дʿ⣬�����дʼ��뵽HashMap�У�����DFA�㷨ģ��
 * @Project��test
 * @Author : ��Ρ
 */
public class SensitiveWordInit {
	//private String ENCODING = "GBK";    //�ַ�����
	private String ENCODING = "UTF-8";    //�ַ�����
	@SuppressWarnings("rawtypes")
	public HashMap sensitiveWordMap;

	public SensitiveWordInit(){
		super();
	}

	@SuppressWarnings("rawtypes")
	public Map initKeyWord(){
		try {
			//��ȡ���дʿ�
			Set<String> keyWordSet = readSensitiveWordFile();
			//�����дʿ���뵽HashMap��
			addSensitiveWordToHashMap(keyWordSet);
			//spring��ȡapplication��Ȼ��application.setAttribute("sensitiveWordMap",sensitiveWordMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sensitiveWordMap;
	}

	/**
	 * ��ȡ���дʿ⣬�����дʷ���HashSet�У�����һ��DFA�㷨ģ�ͣ�<br>
	 * �� = {
	 *      isEnd = 0
	 *      �� = {<br>
	 *      	 isEnd = 1
	 *           �� = {isEnd = 0
	 *                �� = {isEnd = 1}
	 *                }
	 *           ��  = {
	 *           	   isEnd = 0
	 *           		�� = {
	 *           			 isEnd = 1
	 *           			}
	 *           	}
	 *           }
	 *      }
	 *  �� = {
	 *      isEnd = 0
	 *      �� = {
	 *      	isEnd = 0
	 *      	�� = {
	 *              isEnd = 0
	 *              �� = {
	 *                   isEnd = 1
	 *                  }
	 *              }
	 *      	}
	 *      }
	 * @author ��Ρ
	 * @param keyWordSet  ���дʿ�
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void addSensitiveWordToHashMap(Set<String> keyWordSet) {
		sensitiveWordMap = new HashMap(keyWordSet.size());     //��ʼ�����д��������������ݲ���
		String key = null;
		Map nowMap = null;
		Map<String, String> newWorMap = null;
		//����keyWordSet
		Iterator<String> iterator = keyWordSet.iterator();
		while(iterator.hasNext()){
			key = iterator.next();    //�ؼ���
			nowMap = sensitiveWordMap;
			for(int i = 0 ; i < key.length() ; i++){
				char keyChar = key.charAt(i);       //ת����char��
				Object wordMap = nowMap.get(keyChar);       //��ȡ

				if(wordMap != null){        //������ڸ�key��ֱ�Ӹ�ֵ
					nowMap = (Map) wordMap;
				}
				else{     //���������򹹽�һ��map��ͬʱ��isEnd����Ϊ0����Ϊ���������һ��
					newWorMap = new HashMap<String,String>();
					newWorMap.put("isEnd", "0");     //�������һ��
					nowMap.put(keyChar, newWorMap);
					nowMap = newWorMap;
				}

				if(i == key.length() - 1){
					nowMap.put("isEnd", "1");    //���һ��
				}
			}
		}
	}

	/**
	 * ��ȡ���дʿ��е����ݣ���������ӵ�set������
	 * @author ��Ρ
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("resource")
	private Set<String> readSensitiveWordFile() throws Exception{
		Set<String> set = null;
		//String url = SensitiveWordInit.class.getResource("/key.txt").getFile();
		String url="C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\threeBlog\\key.txt";
		File file = new File(url);    //��ȡ�ļ�
		InputStreamReader read = new InputStreamReader(new FileInputStream(file),ENCODING);
		try {
			if(file.isFile() && file.exists()){      //�ļ����Ƿ����
				set = new HashSet<>();
				BufferedReader bufferedReader = new BufferedReader(read);
				String txt ;
				while((txt = bufferedReader.readLine()) != null){    //��ȡ�ļ������ļ����ݷ��뵽set��
					set.add(txt);
				}
			}
			else{         //�������׳��쳣��Ϣ
				throw new Exception("���дʿ��ļ�������");
			}
		} catch (Exception e) {
			throw e;
		}finally{
			read.close();     //�ر��ļ���
		}
		return set;
	}
}
