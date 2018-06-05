package threeblog.tools;

import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * @Description: ���дʹ���
 * @Project��test
 * @Author : ��Ρ
 */
public class SensitivewordFilter {
    @SuppressWarnings("rawtypes")
    private Map sensitiveWordMap = null;
    public static int minMatchTYpe = 1;      //��Сƥ�����
    public static int maxMatchType = 2;      //���ƥ�����

    /**
     * ���캯������ʼ�����дʿ�
     */
    public SensitivewordFilter() {
        sensitiveWordMap = new SensitiveWordInit().initKeyWord();
    }

    /**
     * �ж������Ƿ���������ַ�
     *
     * @param txt       ����
     * @param matchType ƥ�����&nbsp;1����Сƥ�����2�����ƥ�����
     * @return ����������true�����򷵻�false
     * @author ��Ρ
     */
    public boolean isContaintSensitiveWord(String txt, int matchType) {
        boolean flag = false;
        for (int i = 0; i < txt.length(); i++) {
            int matchFlag = this.CheckSensitiveWord(txt, i, matchType); //�ж��Ƿ���������ַ�
            if (matchFlag > 0) {    //����0���ڣ�����true
                flag = true;
            }
        }
        return flag;
    }

    /**
     * ��ȡ�����е����д�
     *
     * @param txt       ����
     * @param matchType ƥ�����&nbsp;1����Сƥ�����2�����ƥ�����
     * @return
     * @author ��Ρ
     */
    public Set<String> getSensitiveWord(String txt, int matchType) {
        Set<String> sensitiveWordList = new HashSet<>();

        for (int i = 0; i < txt.length(); i++) {
            int length = CheckSensitiveWord(txt, i, matchType);    //�ж��Ƿ���������ַ�
            if (length > 0) {    //����,����list��
                sensitiveWordList.add(txt.substring(i, i + length));
                i = i + length - 1;    //��1��ԭ������Ϊfor������
            }
        }

        return sensitiveWordList;
    }

    /**
     * �滻�������ַ�
     *
     * @param txt
     * @param matchType
     * @param replaceChar �滻�ַ���Ĭ��*
     * @author ��Ρ
     */
    public String replaceSensitiveWord(String txt, int matchType, String replaceChar) {
        String resultTxt = txt;
        Set<String> set = getSensitiveWord(txt, matchType);     //��ȡ���е����д�
        Iterator<String> iterator = set.iterator();
        String word = null;
        String replaceString = null;
        while (iterator.hasNext()) {
            word = iterator.next();
            replaceString = getReplaceChars(replaceChar, word.length());
            resultTxt = resultTxt.replaceAll(word, replaceString);
        }

        return resultTxt;
    }

    /**
     * ��ȡ�滻�ַ���
     *
     * @param replaceChar
     * @param length
     * @return
     * @author ��Ρ
     */
    private String getReplaceChars(String replaceChar, int length) {
        String resultReplace = replaceChar;
        for (int i = 1; i < length; i++) {
            resultReplace += replaceChar;
        }

        return resultReplace;
    }

    /**
     * ����������Ƿ���������ַ������������£�<br>
     *
     * @param txt
     * @param beginIndex
     * @param matchType
     * @author ��Ρ
     * @return��������ڣ��򷵻����д��ַ��ĳ��ȣ������ڷ���0
     */
    @SuppressWarnings({"rawtypes"})
    public int CheckSensitiveWord(String txt, int beginIndex, int matchType) {
        boolean flag = false;    //���дʽ�����ʶλ���������д�ֻ��1λ�����
        int matchFlag = 0;     //ƥ���ʶ��Ĭ��Ϊ0
        char word = 0;
        Map nowMap = sensitiveWordMap;
        for (int i = beginIndex; i < txt.length(); i++) {
            word = txt.charAt(i);
            nowMap = (Map) nowMap.get(word);     //��ȡָ��key
            if (nowMap != null) {     //���ڣ����ж��Ƿ�Ϊ���һ��
                matchFlag++;     //�ҵ���Ӧkey��ƥ���ʶ+1
                if ("1".equals(nowMap.get("isEnd"))) {       //���Ϊ���һ��ƥ�����,����ѭ��������ƥ���ʶ��
                    flag = true;       //������־λΪtrue
                    if (SensitivewordFilter.minMatchTYpe == matchType) {    //��С����ֱ�ӷ���,���������������
                        break;
                    }
                }
            } else {     //�����ڣ�ֱ�ӷ���
                break;
            }
        }
        if (matchFlag < 2 || !flag) {        //���ȱ�����ڵ���1��Ϊ��
            matchFlag = 0;
        }
        return matchFlag;
    }

    /**
     * �ж��Ƿ������д�
     *
     * @param word
     * @return
     */
    public boolean isSensitive(String word) {
        Set<String> words = getSensitiveWord(word, 1);
        return words != null && words.size() > 0;
    }

    public static void main(String[] args) throws Exception {
        SensitivewordFilter filter = new SensitivewordFilter();
        System.out.println("���дʵ�������" + filter.sensitiveWordMap.size());
		String string = "̫����˸��黳Ҳ��ֻ�������������� ӫĻ�е���ڣ����˹�������ȥ��ĳ�ַ�ʽ�����ĺ�����������ɱָ�ϻ���Щ�Լ��������˸С�"
				+ "Ȼ���ֹ� ���ǵİ��ݵĽ�ɫ���Ǹ��������˹���ϲ������� ŭ���ֶ�����ǣǿ�İ��Լ������Ҳ��������Ļ����У�Ȼ��ж������ᣬ"
				+ "�ѹ�������ĳһ���˵Ļ��ﾡ��Ĳ�����������ֻ���������һ����һ�����һ����Ӱ��ҹ����Ƭ ���˾������ϣ����ϵ绰�����ķ����š�";
		System.out.println("�������䣺"+string);
		System.out.println("��������������" + string.length());
		long beginTime = System.currentTimeMillis();
		Set<String> set = filter.getSensitiveWord(string, 1);
		long endTime = System.currentTimeMillis();
		System.out.println("����а������дʵĸ���Ϊ��" + set.size() + "��������" + set);
		String result=filter.replaceSensitiveWord(string,1,"*");
		System.out.println("���д��滻�����"+result);
		System.out.println("�ܹ�����ʱ��Ϊ��" + (endTime - beginTime));
        //test();
    }

    public static void test() throws Exception {
        //File file = new File("D:\\key.txt");
        String file1 = SensitivewordFilter.class.getResource("../key3.txt").getFile();
        System.out.println(file1);

        File file = new File(file1);
        InputStreamReader in = new InputStreamReader(new FileInputStream(file), "utf-8");
        BufferedReader bufferedReader = new BufferedReader(in);
        Set<String> set = new HashSet<>();
        String txt;
        while ((txt = bufferedReader.readLine()) != null) {    //��ȡ�ļ������ļ����ݷ��뵽set��
            set.add(txt);
        }
        bufferedReader.close();
        in.close();
        File file2 = new File("D:\\���дʴʿ�1.5W.txt");
        InputStreamReader in2 = new InputStreamReader(new FileInputStream(file2), "utf-8");
        BufferedReader bufferedReader2 = new BufferedReader(in2);
        while ((txt = bufferedReader2.readLine()) != null) {    //��ȡ�ļ������ļ����ݷ��뵽set��
            set.add(txt);
        }
        bufferedReader.close();
        in.close();
        File f = new File("D:\\key3.txt");
        OutputStreamWriter w = new OutputStreamWriter(new FileOutputStream(f), "utf-8");
        BufferedWriter writer = new BufferedWriter(w);
        for (String s : set) {
            if(StringUtils.isNotBlank(s)){
                writer.write(s);
                writer.newLine();
                writer.flush();
            }
        }
        writer.close();
    }
}
