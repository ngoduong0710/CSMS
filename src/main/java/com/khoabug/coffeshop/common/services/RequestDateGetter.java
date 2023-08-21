package com.khoabug.coffeshop.common.services;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author : KhoaBug
 * @since : 8/18/2023 ,Fri
 */
public class RequestDateGetter {
    private static final Logger LOGGER = LogManager.getLogger(RequestDateGetter.class);
    private static final String PATTERN = "MMM dd,yyyy";
    private static final String ANO_PATTERN = "yyyy-MM-dd";

    private static final String REGEX = " - ";
    private static final SimpleDateFormat simpleDateFormat = new SimpleDateFormat(PATTERN);
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat(ANO_PATTERN);

    public static Date getStartDate(String dateRange) {
        String[] dates = dateRange.split(REGEX);
        return getDate(dates[0], simpleDateFormat);
    }

    public static Date getEndDate(String dateRange) {
        String[] dates = dateRange.split(REGEX);
        return getDate(dates[1], simpleDateFormat);
    }

    public static Date getDate(String date) {
        return getDate(date, dateFormat);
    }

    private static Date getDate(String dateRange, SimpleDateFormat simpleDateFormat) {
        Date date = null;
        try {
            date = simpleDateFormat.parse(dateRange.trim());
        } catch (ParseException e) {
            LOGGER.error(e.getMessage(), e.getCause());
        }
        return date;
    }
}
