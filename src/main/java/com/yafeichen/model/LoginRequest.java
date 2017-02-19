package com.yafeichen.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by colin on 2017/2/10.
 */

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LoginRequest {
    //账号
    private String userName;
    //密码
    private String userPassword;
}
