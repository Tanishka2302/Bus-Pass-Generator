package com.helper;

import java.net.URLEncoder;

import com.constant.ServerConstants;

public class SMSSender  {
	String recipient="";
	String message="";
    
    public SMSSender(String recipient, String message) {
        this.recipient = recipient;
        this.message = message;
        if( this.message.length()>140){
        	 this.message= this.message.substring(0,140);
        }
    }
    public static void main(String[] args) {
        String sms[] = {"8866899285","7741055935"};
        for (int i = 0; i < sms.length; i++) {

            SMSSender sender = new SMSSender(sms[i], " Royal Sell, Akurdi, Pune, Maharashtra 411033  Mobile no: 8866899285");
            try
            {
                sender.send();
                Thread.sleep(4000);
            } catch (Exception e) 
            {
                e.printStackTrace();
            }
        }
    }

	
    public int send() throws Exception {

    	System.out.println("Sending SMS "+recipient+" "+message);
    	String url=ServerConstants.SMS_URL+recipient.trim()+"&udh=&message="+URLEncoder.encode(message);
    	System.out.println(url);
    	StringHelper.connect2Server(url);
        return 0;
    }
   
}