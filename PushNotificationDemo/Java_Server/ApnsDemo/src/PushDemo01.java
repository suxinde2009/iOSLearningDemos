import javapns.back.PushNotificationManager;
import javapns.back.SSLConnectionHelper;
import javapns.data.Device;
import javapns.data.PayLoad;

public class PushDemo01 {
	public static void main(String[] args) throws Exception {
		try {
			  //从客户端获取的deviceToken，在此为了测试简单，写固定的一个测试设备标识。
	           String deviceToken = "281e29c5 dc7840a8 efea26e9 8fa7ed65 ebf7ac5e 457779f9 4b0d2280 294317ce";
	            System.out.println("Push Start deviceToken:" + deviceToken);
	            //定义消息模式
	            PayLoad payLoad = new PayLoad();
	            payLoad.addAlert("this is test!");
	            payLoad.addBadge(1);//消息推送标记数，小红圈中显示的数字。
	            payLoad.addSound("default");
	            //注册deviceToken
	            PushNotificationManager pushManager = PushNotificationManager.getInstance();
	            pushManager.addDevice("iPhone", deviceToken);
	            //连接APNS
	            String host = "gateway.sandbox.push.apple.com";
	            //String host = "gateway.push.apple.com";
	            int port = 2195;
	            String certificatePath = "/Users/suxinde/Documents/Workspaces/MyEclipse 10/ApnsDemo/PushDemo1.p12";//前面生成的用于JAVA后台连接APNS服务的*.p12文件位置
	            String certificatePassword = "111111";//p12文件密码。
	            pushManager.initializeConnection(host, port, certificatePath, certificatePassword, SSLConnectionHelper.KEYSTORE_TYPE_PKCS12);
	            //发送推送
	            Device client = pushManager.getDevice("iPhone");
	            System.out.println("推送消息: " + client.getToken()+"\n"+payLoad.toString() +" ");
	            pushManager.sendNotification(client, payLoad);
	            //停止连接APNS
	            pushManager.stopConnection();
	            //删除deviceToken
	            pushManager.removeDevice("iPhone");
	            System.out.println("Push End");
	        }
	        catch (Exception ex)
	        {
	            ex.printStackTrace();
	        }

	}
}
