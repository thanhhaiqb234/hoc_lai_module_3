package com.example.xay_dung_ung_dung_login.service;

import com.example.xay_dung_ung_dung_login.repository.LoginRepository;

public class LoginService {
    public static final LoginRepository loginRepository = new LoginRepository();

    public String checkLogin(String name, String password) {
        return loginRepository.checkLogin(name,password);
    }
}
