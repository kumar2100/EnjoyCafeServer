
package validate;

import java.util.*;

public class TimeCalVectorTest
{
    Vector v = new Vector();

    public TimeCalVectorTest()
    {
        long startTime = System.currentTimeMillis(); // Get the start Time
        long endTime = 0;
        
        //Trying another way
        Calendar calendar = Calendar.getInstance();
        Date startDate = calendar.getTime();
        long startcal = calendar.getTimeInMillis();
       
   
        

       System.out.println( startTime);

       for(int i=0;i<100000;i++)
       {
           v.add(i);
       }

        for(int i=0;i<v.size();i++)
        {
            System.out.println(v.get(i));
        }
        endTime = System.currentTimeMillis(); //Get the end Time

        System.out.println(endTime);

        System.out.println("Difference in mili seconds: "+ (endTime-startTime)); //Print the difference in mili seconds
        System.out.println("Differencce in Seconds: "+ (endTime-startTime)/1000); // Print the difference in seconds
        System.out.println("Differencce in Minutes: "+ (((endTime-startTime)/1000))/60); // Print the difference in seconds
        
        //Trying another way
        Date endDate = calendar.getTime();
        long sumDate = endDate.getTime() - startDate.getTime();
        
       Calendar gcalendar = new GregorianCalendar();
       gcalendar.setTime(endDate);
       // endDate.toString();
         long endcal = calendar.getTimeInMillis();
         long total = endcal-startcal;
         
         
         //calendar.setTimeInMillis(total);
        
           
        System.out.println("sum date using calendar: "+sumDate);
        System.out.println(": total:"+total);
       
        System.out.println("sum date using endDate.toString();: "+endDate.toString());

    
    }

    public static void main(String[]args)
    {
        new TimeCalVectorTest();
    }
}