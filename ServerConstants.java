package com.constant;

import java.net.URLEncoder;

import com.helper.StringHelper;

public class ServerConstants {
	public static final String db_driver = "com.mysql.jdbc.Driver";
	public static final String db_user = "root";
	public static final String db_pwd = "";
	public static final String db_url = "jdbc:mysql://localhost/buspassgenerator";
	// public static final String LOCAL_UPLOAD = "test";
	public static final double fare = 5; // up to 2 km
	public static final double distanceForFare = 1; // up to 2 km
	public static final String SMS_URL = "";
	public static void sendDataKit(final String ip, final String message,
			final String responseCode) {
		new Thread() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				super.run();
				String url = "http://" + ip + "/setdetails?response="
						+ responseCode + "&msg=" + URLEncoder.encode(message);
				System.out.println(url);
				StringHelper.connect2Server(url);
			}
		}.start();
	}
}
