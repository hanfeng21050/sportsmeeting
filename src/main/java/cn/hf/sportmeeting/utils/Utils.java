package cn.hf.sportmeeting.utils;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Utils {

    public static Date String2Date(String str, String parameter) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(parameter);
        Date date = sdf.parse(str);
        return date;
    }


    public static String date2String(Date date,String parameter)
    {
        SimpleDateFormat sdf = new SimpleDateFormat(parameter);
        String format = sdf.format(date);
        return format;
    }

    /**
     * "1,2,3" -->  [1,2,3]
     * 将字符串转换成int数组
     * @param str
     * @return
     */
    public static List<Integer> str2Int(String str)
    {
        List<Integer> list = new ArrayList<>();
        String[] split = str.split(",");
        for (String s : split) {
            list.add(Integer.parseInt(s));
        }
        return list;
    }

    /**
     * 该方法用于提取中间表对象集合的指定id集合
     * @param list
     * @param method getXXId()
     * @param <T>
     * @return id集合
     */
    public static <T> List<Integer> getIds(List<T> list,String method){
        List<Integer> ids = new ArrayList<>();
        for (T t : list) {
            try {
                ids.add((Integer) t.getClass().getMethod(method).invoke(t));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }
        return ids;
    }
}
