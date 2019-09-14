package cn.hf.sportmeeting.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

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
}
