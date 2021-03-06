package com.cc.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

public class DateUtil {
    private static SimpleDateFormat sdfDataBase=new SimpleDateFormat("yyyyMMddHHmm");
    private static SimpleDateFormat sdfJSP=new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
    private static SimpleDateFormat sdfTimeStamp=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public static String javaStringFormDateTimeLocalFormatToDataBaseVarchar(String javaString){
        String[] dateTime = javaString.split("T");
        if(dateTime.length>1) {
            String date = dateTime[0];
            String time = dateTime[1];
            String[] ymd = date.split("-");
            String[] hm = time.split(":");
            return ymd[0] + ymd[1] + ymd[2] + hm[0] + hm[1];
        }else {
            return javaString;
        }
    }

    public static String dataBaseVarcharFormDateTimeLocalFormatTojavaString(String dataBaseVarchar){
        return dataBaseVarchar.substring(0,4)+"年"+dataBaseVarchar.substring(4,6)+"月"+dataBaseVarchar.substring(6,8)+"日 "
                +dataBaseVarchar.substring(8,10)+":"+dataBaseVarchar.substring(10);
    }

    public static String getDataBaseVarchar(){
        return sdfDataBase.format(new Date());
    }

    public static String getJSPString(){
        return sdfJSP.format(new Date());
    }

    public static Timestamp getSqlDate() {
        return Timestamp.valueOf(sdfTimeStamp.format(new Date()));
    }

    public static String getSqlDateString() {
        return sdfTimeStamp.format(new Date());
    }
    public static Timestamp getSqlDate(String dateTimeLocal) {
        String sqlDate=dateTimeLocal.replace("T"," ");
        if(sqlDate.split(":").length==2){
            sqlDate=sqlDate+":00";
        }else if(sqlDate.split(":").length!=3){
            return null;
        }
        return Timestamp.valueOf(sqlDate);
    }

    public static String transDataBaseDate(Date date){
        return sdfJSP.format(date);
    }

    public static String transTimeStamp(Date date){
        return sdfTimeStamp.format(date);
    }
}
