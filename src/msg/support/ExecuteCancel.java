package msg.support;

import java.util.Arrays;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;


public class ExecuteCancel {
	
    static BootpayApi api;

    public static void goGetToken() {
        try {
        	api = new BootpayApi("5dd11c974f74b4002fc15acb", "th4wAoktfKVuaRD2+hj2lRfz0vGplhcyydURVQLHPtQ=");
            api.getAccessToken();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String goCancel(String receipt_id) {
        Cancel cancel = new Cancel();
//        cancel.receipt_id = "5ddf590e5ade16002f2ba2ed";
        cancel.receipt_id = receipt_id;
        cancel.name = "관리자 홍길동";
        cancel.reason = "택배 지연에 의한 구매자 취소요청";

        try {
            HttpResponse res = api.cancel(cancel);
            String result = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

}
