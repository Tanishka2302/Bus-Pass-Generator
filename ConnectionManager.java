/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.swing.JOptionPane;

import com.constant.ServerConstants;
import com.helper.DBUtils;
import com.helper.PassModel;
import com.helper.SMSSender;
import com.helper.StringHelper;
import com.helper.UserModel;
import com.sun.javafx.css.CalculatedValue;
import com.sun.xml.internal.ws.api.ha.StickyFeature;

public class ConnectionManager extends DBUtils {

	public static Connection getDBConnection() {
		Connection conn = null;
		try {
			Class.forName(ServerConstants.db_driver);
			conn = DriverManager.getConnection(ServerConstants.db_url,
					ServerConstants.db_user, ServerConstants.db_pwd);
			System.out.println("Got Connection");
		} catch (SQLException ex) {
			ex.printStackTrace();
			JOptionPane.showMessageDialog(
					null,
					"Please start the mysql Service from XAMPP Console.\n"
							+ ex.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return conn;
	}

	public static UserModel checkLogin(HashMap parameters) {
		String userNameId = StringHelper.n2s(parameters.get("username"));
		String pass = StringHelper.n2s(parameters.get("password"));
		System.out.println("Name :" + userNameId + " and password :" + pass);
		// String pass=new
		// StringEncrypter(StringEncrypter.DESEDE_ENCRYPTION_SCHEME).encrypt(password);
		String query = "SELECT * FROM user where username like ? and userpass like ?";
		UserModel um = null;
		List list = DBUtils.getBeanList(UserModel.class, query, userNameId,
				pass);
		System.out.println("size:" + list.size());

		if (list.size() > 0) {
			um = (UserModel) list.get(0);
			System.out.println("Here in" + (UserModel) list.get(0));
		}
		System.out.println("Here out:" + list.size());
		System.out.println("um::" + um);
		return um;
	}

	public static String registerNewUser(HashMap parameters) {
		System.out.println(parameters);
		System.out.println("register connectionmanager");
		String success = "";
		String sql;
		int list = 0;
		// role, name, mobile, email, enrollno, address, username, userpass
		String role = StringHelper.n2s(parameters.get("role"));
		String fname = StringHelper.n2s(parameters.get("fname"));
		String lname = StringHelper.n2s(parameters.get("lname"));
		String name = fname + "" + lname;
		String mobile = StringHelper.n2s(parameters.get("mobile"));
		String email = StringHelper.n2s(parameters.get("email"));

		String username = StringHelper.n2s(parameters.get("username"));
		String userpass = StringHelper.n2s(parameters.get("userpass"));

		if (role.equalsIgnoreCase("1")) {
			//student
			String enrollno = StringHelper.n2s(parameters.get("enrollno"));
			String address = StringHelper.n2s(parameters.get("address"));

			sql = "INSERT INTO user(role, name, mobile, email, enrollno, address, username, userpass)"+
"VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			list = DBUtils.executeUpdate(sql, role, name, mobile, email,
					enrollno, address, username, userpass);
		} else if (role.equalsIgnoreCase("2")) {
//admin
			sql = "insert into user (role, name, mobile, email,username, userpass) values(?,?,?,?,?,?)";
			list = DBUtils.executeUpdate(sql, role, name, mobile, email,
					username, userpass);
		}
		if (list > 0) {
			success = "1";
		} else {
			success = "0";
		}

		return success;
	}

	public static String registerPass(HashMap parameters) {
		System.out.println(parameters);
		System.out.println("register connectionmanager");
		String success = "";
		String sql;
		int list = 0;

		// scname, sname, std, div, rollno, source,
		// destination,passamt,issuedate, expdate
		String scname = StringHelper.n2s(parameters.get("scname"));
		String sname = StringHelper.n2s(parameters.get("sname"));
		String std = StringHelper.n2s(parameters.get("std"));
		String div = StringHelper.n2s(parameters.get("div"));
		String rollno = StringHelper.n2s(parameters.get("rollno"));
		String source = StringHelper.n2s(parameters.get("source"));
		String destination = StringHelper.n2s(parameters.get("destination"));
		String passamt = StringHelper.n2s(parameters.get("passamt"));
		String issuedate = StringHelper.n2s(parameters.get("issuedate"));
		String expdate = StringHelper.n2s(parameters.get("expdate"));
		String enrollno = StringHelper.n2s(parameters.get("enrollno"));

		sql = "insert into user(scname, sname, std, div, rollno, source, destination, passamt, issuedate, expdate) "
				+ "values(?,?,?,?,?,?,?,?,?,?)";
		list = DBUtils.executeUpdate(sql, scname, sname, std, div, rollno,
				source, destination, passamt, issuedate, expdate);

		if (list > 0) {
			success = "1";
		} else {
			success = "0";
		}

		return success;
	}

	public static String updateProfile(HashMap parameters) {
		// userid, fname, lname, emailid, phoneno, address, aadhar, userpass,
		// username, roleid, nfcid, balance
		System.out.println(parameters);
		String success = "";

		String userId = StringHelper.n2s(parameters.get("userId"));
		String emailid = StringHelper.n2s(parameters.get("emailid"));
		String address = StringHelper.n2s(parameters.get("address"));
		String aadhar = StringHelper.n2s(parameters.get("aadhar"));
		String userpass = StringHelper.n2s(parameters.get("userpass"));
		String sql = "update userdata set emailid = ?, address = ?, aadhar=?, userpass = ? where userid = ?;";
		int list = DBUtils.executeUpdate(sql, emailid, address, aadhar,
				userpass, userId);
		if (list > 0) {
			success = "1";
		} else {
			success = "0";
		}
		return success;
	}

	public static List getStation() {
		String query = "select * from station";

		List list = DBUtils.getMapList(query);
		return list;
	}

	public static String getCredsFromImei(String imei) {

		String query = "select * from userdata where imei='" + imei + "'";

		List list = DBUtils.getBeanList(UserModel.class, query);
		UserModel um = null;
		if (list.size() > 0) {
			um = (UserModel) list.get(0);
			String data = um.getUsername().toString() + ","
					+ um.getUserpass().toString();
			return data;
		}
		return "";
	}

	public static com.helper.UserModel getBalance(String userId) {
		String query = "SELECT balance FROM userdata WHERE userid  LIKE '"
				+ userId + "' ";
		UserModel um = null;
		List list = DBUtils.getBeanList(UserModel.class, query);
		if (list.size() > 0) {
			um = (UserModel) list.get(0);
			System.out.println("Here in");
		}
		System.out.println("Here out:" + list.size());
		return um;

	}

	public static String getUserPhone(String uid) {
		String mobileno = "";
		UserModel um = null;
		String query = "SELECT mobile FROM `user` where userid like "
				+ uid + "";
		List list = DBUtils.getBeanList(UserModel.class, query);
		if (list.size() > 0) {
			um = (UserModel) list.get(0);
			mobileno = um.getMobile();
		}
		return mobileno;
	}

	public static String getJourney(HashMap parameters) {
		String success = null;
		System.out.print(parameters);
		String status = null;
		int list = 0;

		String sid = StringHelper.n2s(parameters.get("sid"));
		String IP = StringHelper.n2s(parameters.get("IP"));
		String kitid = StringHelper.n2s(parameters.get("ArduinoKitId"));
		String nfcid = StringHelper.n2s(parameters.get("nfccardno"));
		String imei = StringHelper.n2s(parameters.get("imei"));

		UserModel um = getUserId(nfcid, imei);
		String userId = um.getUid();
		String mobileno = getUserPhone(userId);
		System.out.print("user=" + userId);
		String sids = null;
		String q = "SELECT i_id,sid FROM inoutdata WHERE userid  LIKE '"
				+ userId + "' AND status in (1)";
		List inList = DBUtils.getMapList(q);
		if (inList != null && inList.size() > 0) {
			success = "OUT";
			status = "0";// for person out
			HashMap map = (HashMap) inList.get(0);
			String id = StringHelper.n2s(map.get("i_id"));

			sids = StringHelper.n2s(map.get("sid")) + "," + sid;
			System.out.print(success);
			String query1 = "update inoutdata set sid=?, status = ?  where i_id like ?";
			int data = DBUtils.executeUpdate(query1, sids, status, id);
			double fare = fareCalculator(sids, userId);
			success += "  Fare for journey Rs. : " + fare;
			um = getBalance(userId);
			String bal = um.getBalance();

			if (StringHelper.n2d(fare) > StringHelper.n2d(bal)) {
				String retMsg = "User DOES  NOT HAVE SUFFICIENT BALANCE ["
						+ bal + "] Fare [" + fare + "]";
				System.err.println(retMsg);
				String reci = um.getMobile();
				String message = "Dear " + um.getName() + " Tarrif of " + fare
						+ " can not be deducted due to insufficient balance";
				String responseCode = "0";
				// ServerConstants.sendDataKit(IP, message, responseCode);
				try {

					new SMSSender(reci, message).send();
					System.out.print(retMsg);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				return message;
			}
			System.out.println(id);
		} else {
			success = "IN ";
			status = "1";// for person in

			System.out.print(success);
			String query = "insert into inoutdata (sid,kitid,status,kitip,nfcid,userid,imei)values(?,?,?,?,?,?,?)";
			list = DBUtils.executeUpdate(query, sid, kitid, status, IP, nfcid,
					userId, imei);
		}

		return success;

	}

	public static double fareCalculator(String sids, String userId) {

		String q = "select distance,stationname from station where sid in ( "
				+ sids + ")";

		List stationList = DBUtils.getBeanList(PassModel.class, q);
		if (stationList != null && stationList.size() > 0) {
			PassModel j1 = (PassModel) stationList.get(0);
			String fromStation = j1.getStationname();
			PassModel j2 = (PassModel) stationList.get(1);
			String toStation = j2.getStationname();
			double dist = (StringHelper.n2d(j2.getDistance()) - StringHelper
					.n2d(j1.getDistance())) / ServerConstants.distanceForFare;
			double fare = Math.round(dist * ServerConstants.fare);
			UserModel um = getBalance(userId);
			String mobileno = getUserPhone(userId);
			double balance = 0;//StringHelper.n2d(um.getBalance());
			if (fare < balance) {
				DBUtils.executeUpdate(
						"update userdata set balance = balance - " + fare
								+ " where userid = ?;", userId);
				sendMSGToMobile(mobileno, "Thanks You Dear , Tarrif of " + fare
						+ " deducted from your wallet.");

				DBUtils.executeUpdate(
						"insert into journeydata(stationsource, stationdestination, fare,userid) values(?,?,?,?)",
						fromStation, toStation, fare, userId);
				return fare;
			} else {

				sendMSGToMobile(mobileno,
						"Hello dear, Insufficient balance in your wallet please recharge.");
			}

		}

		return 0.0;
	}

	public static String getfare(HashMap parameters) {
		String result = "";
		String userId = StringHelper.n2s(parameters.get("userId"));
		String from = StringHelper.n2s(parameters.get("from"));
		String to = StringHelper.n2s(parameters.get("to"));

		String sids = from + "," + to;

		String q = "select distance,stationname from station where sid in ( "
				+ sids + ")";

		List stationList = DBUtils.getBeanList(PassModel.class, q);

		if (stationList != null && stationList.size() > 0) {
			PassModel j1 = (PassModel) stationList.get(0);
			String fromStation = j1.getStationname();
			PassModel j2 = (PassModel) stationList.get(1);
			String toStation = j2.getStationname();

			double dist = (StringHelper.n2d(j2.getDistance()) - StringHelper
					.n2d(j1.getDistance())) / ServerConstants.distanceForFare;
			double fare = Math.round(dist * ServerConstants.fare);
			System.out.println("fare>>>>" + fare);

			result = StringHelper.n2s(fare);

			return result;
		}
		return result;

	}

	public static com.helper.UserModel getUserId(String nfcid, String imei) {
		String query = "SELECT userid FROM userdata where nfcid like '" + nfcid
				+ "' OR imei like '" + imei + "'";
		UserModel um = null;
		List list = DBUtils.getBeanList(UserModel.class, query);
		if (list.size() > 0) {
			um = (UserModel) list.get(0);
			System.out.println("Here in");
		}
		System.out.println("Here out:" + list.size());
		return um;
	}

	public static String rechargeAccount(HashMap parameters) {

		System.out.println(parameters);
		String success = "";

		String userId = StringHelper.n2s(parameters.get("userId"));
		String amount = StringHelper.n2s(parameters.get("amount"));
		String currentBalance = StringHelper.n2s(parameters
				.get("currentBalance"));

		String balance = String.valueOf(Float.parseFloat(amount)
				+ Float.parseFloat(currentBalance));

		String sql = "update userdata set balance = ? where userid = ?;";
		int list = DBUtils.executeUpdate(sql, balance, userId);
		if (list > 0) {
			success = "Account Recharged Successfully";
		} else {
			success = "Error Recharging Account";
		}
		return success;
	}

	public static String addStation(HashMap parameters) {

		System.out.println(parameters);
		String success = "";
		int list = 0;
		String stationname = StringHelper.n2s(parameters.get("stationname"));
		String distance = StringHelper.n2s(parameters.get("distance"));
		String KitId = StringHelper.n2s(parameters.get("kitid"));

		String query = "insert into station(stationname,distance,kitid) values(?,?,?)";

		list = DBUtils.executeUpdate(query, stationname, distance, KitId);

		if (list > 0) {
			success = "1";
		} else {
			success = "0";
		}

		return success;

	}

	public static String sendMSGToMobile(String mobile, String message) {

		String sms[] = { mobile };
		System.out.println(":::::" + sms[0]);
		for (int i = 0; i < sms.length; i++) {

			SMSSender sender = new SMSSender(sms[i], message);
			try {
				sender.send();
				Thread.sleep(4000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "Y";
	}

	public static String getCsvString(String query) {
		String success = "";
		Connection conn = null;
		ResultSet rs = null;
		StringBuffer sv = new StringBuffer();
		try {
			conn = ConnectionManager.getDBConnection();
			rs = conn.createStatement().executeQuery(query);
			System.out.println("Executing " + query);
			while (rs.next()) {
				success = rs.getString(1);
				sv.append(success + ",");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sv.toString();
	}

	public static void closeConnection(Connection conn) {
		try {
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void main(String[] args) {
		getDBConnection();
	}
}
