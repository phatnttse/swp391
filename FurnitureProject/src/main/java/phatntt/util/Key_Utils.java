/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.mindrot.jbcrypt.BCrypt;
import phatntt.dto.UsersDTO;

/**
 *
 * @author Admin
 */
public class Key_Utils {

    // Biến tĩnh để lưu thể hiện duy nhất của lớp
    private static Key_Utils instance;

    // Phương thức tĩnh để trả về thể hiện duy nhất của lớp
    public static Key_Utils getInstance() {
        if (instance == null) {
            instance = new Key_Utils();
        }
        return instance;
    }

    private Key_Utils() {
        // Private constructor để ngăn chặn việc tạo mới đối tượng từ bên ngoài lớp
    }

    public String hashPassword(String password) {
        // Tạo salt mới cho mỗi mật khẩu
        String salt = BCrypt.gensalt();

        // Băm mật khẩu với salt
        return BCrypt.hashpw(password, salt);
    }

    public boolean checkPassword(String password, String hashedPassword) {
        // Kiểm tra xem mật khẩu nhập vào có khớp với mật khẩu đã băm hay không
        return BCrypt.checkpw(password, hashedPassword);
    }

    public String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.LoginWithGoogleFeatures.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.LoginWithGoogleFeatures.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.LoginWithGoogleFeatures.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.LoginWithGoogleFeatures.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.LoginWithGoogleFeatures.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public UsersDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.LoginWithGoogleFeatures.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UsersDTO googlePojo = new Gson().fromJson(response, UsersDTO.class);

        return googlePojo;
    }
}
