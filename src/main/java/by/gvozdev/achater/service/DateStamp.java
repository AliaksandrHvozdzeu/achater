package by.gvozdev.achater.service;

import org.springframework.stereotype.Service;

/**
 * Created by Gvozdev A.N. on 05.2018.
 */
@Service
public class DateStamp {

    public Long dateStamp() {

        long dateStamp = System.currentTimeMillis() / 1000;
        return dateStamp;

    }

}
