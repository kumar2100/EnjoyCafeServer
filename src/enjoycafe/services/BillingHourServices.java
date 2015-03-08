/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package enjoycafe.services;

/**
 *
 * @author kumar
 */
public class BillingHourServices {
    
    
    public String computeBillingHour(java.sql.Timestamp first, java.sql.Timestamp second) {
        long milliseconds1 = first.getTime();
        long milliseconds2 = second.getTime();

        long diff = milliseconds2 - milliseconds1;
        long diffSeconds = (diff / 1000);
        long left_milliseconds_to_place_after_calculating_seconds = diff - (diffSeconds * 1000); //To Store seconds after detecting the millseconds calculated

        long diffMinutes = diff / (60 * 1000);
        System.out.println("Total Minutes Calculated: by computeBillingHour  " + diffMinutes);
        //long left_seconds_to_place_after_calculaing_minutes = (diff-(diffMinutes*60 * 1000))/(60*1000); //To Store minutes after detecting the millseconds calculated
        long left_seconds_to_place_after_calculaing_minutes = (diffSeconds - (diffMinutes * 60)); //To Store minutes after detecting the millseconds calculated
        System.out.println("left_seconds_to_place_after_calculaing_minutes: computeBillingHour " + left_seconds_to_place_after_calculaing_minutes);


        long diffHours = diff / (60 * 60 * 1000);
        long diffDays = diff / (24 * 60 * 60 * 1000);
        String days_hours_minutes_seconds_mill;
        String raw_days_hours_minutes_seconds_mill;

        raw_days_hours_minutes_seconds_mill = Long.toString(diffDays) + ":" + Long.toString(diffHours) + ":" + Long.toString(diffMinutes) + ":" + Long.toString(diffSeconds) + ":" + Long.toString(diff);

        System.out.println("In raw_difference_days_hours_minutes_seconds_mill: " + raw_days_hours_minutes_seconds_mill);

        days_hours_minutes_seconds_mill = Long.toString(diffDays) + ":" + Long.toString(diffHours) + ":" + Long.toString(diffMinutes) + ":" + Long.toString(left_seconds_to_place_after_calculaing_minutes) + ":" + Long.toString(left_milliseconds_to_place_after_calculating_seconds);
        return days_hours_minutes_seconds_mill;
    }

    public long computeBillingMinutes(java.sql.Timestamp first, java.sql.Timestamp second) {
        long milliseconds1 = first.getTime();
        long milliseconds2 = second.getTime();

        long diff = milliseconds2 - milliseconds1;
        long diffSeconds = (diff / 1000);
        long left_milliseconds_to_place_after_calculating_seconds = diff - (diffSeconds * 1000); //To Store seconds after detecting the millseconds calculated

        long diffMinutes = diff / (60 * 1000);
        System.out.println("Total Minutes Calculated: by computeBillingMinutes " + diffMinutes);
        //long left_seconds_to_place_after_calculaing_minutes = (diff-(diffMinutes*60 * 1000))/(60*1000); //To Store minutes after detecting the millseconds calculated
        long left_seconds_to_place_after_calculaing_minutes = (diffSeconds - (diffMinutes * 60)); //To Store minutes after detecting the millseconds calculated
        System.out.println("left_seconds_to_place_after_calculaing_minutes: computeBillingMinutes " + left_seconds_to_place_after_calculaing_minutes);


        long diffHours = diff / (60 * 60 * 1000);
        long diffDays = diff / (24 * 60 * 60 * 1000);
        String days_hours_minutes_seconds_mill;
        String raw_days_hours_minutes_seconds_mill;

        raw_days_hours_minutes_seconds_mill = Long.toString(diffDays) + ":" + Long.toString(diffHours) + ":" + Long.toString(diffMinutes) + ":" + Long.toString(diffSeconds) + ":" + Long.toString(diff);

        System.out.println("In raw_difference_days_hours_minutes_seconds_mill: " + raw_days_hours_minutes_seconds_mill);

        days_hours_minutes_seconds_mill = Long.toString(diffDays) + ":" + Long.toString(diffHours) + ":" + Long.toString(diffMinutes) + ":" + Long.toString(left_seconds_to_place_after_calculaing_minutes) + ":" + Long.toString(left_milliseconds_to_place_after_calculating_seconds);
        return diffMinutes;
    }
    
    public int BillAmount(int billmin){
    
            int amount=0;
        if(billmin<15){
            amount =15;
            return amount;
        }
        
        if(billmin>15){
            int cal =billmin/15;
            amount=cal*15;
            return amount;
        }
        
        
    return amount;
    }
}
