package com.example.xay_dung_ung_dung_login.repository;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class LoginRepository implements ILoginRepository{
    public String checkLogin(String name, String password) {
        LocalDateTime localDateTime = LocalDateTime.now();
        String notification = "";
        for (int i = 0; i < name.length(); i++) {
            if (name.equals("Admin")){
                for (int j = 0; j <password.length(); j++) {
                    if (password.equals("123abc")){
                        notification = "Admin đă đăng nhập thành công vào lúc" + localDateTime ;
                    }else {
                        notification = "Tên đăng nhận hoặc mật khẩu không đúng";
                        return notification;
                    }
                }
            }else {
                notification = "Tên đăng nhận hoặc mật khẩu không đúng";
                return notification;
            }
        }
        return notification;
    }
}
