package stackjava.com.accessgoogle.common;

import java.io.Serializable;

public class Constants  implements Serializable{
	public static String GOOGLE_CLIENT_ID = "688137221585-c3d5ebf5droccpp94a6b1676d4l2lp9v.apps.googleusercontent.com";
	public static String GOOGLE_CLIENT_SECRET = "WCm37wl6RCDwjItTVrM2S-_H";
	public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/J3_L_P0013/MainController?action=loginByGoogle";
	public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
	public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
	public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
