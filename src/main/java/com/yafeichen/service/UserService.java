package com.yafeichen.service;

import com.yafeichen.repository.jpa.entity.UserEntity;
import com.yafeichen.repository.jpa.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by colin on 2017/2/11.
 */

@Slf4j
@Service
public class UserService {

    @Resource
    private UserRepository userRepository;

    public UserEntity login(String userName, String userPassword) {
        UserEntity userEntity = null;
        List<UserEntity> userEntities = userRepository.findByUserNameAndUserPassword(userName, userPassword);
        if (userEntities != null && userEntities.size() > 0) {
            userEntity = userEntities.get(0);
        }
        return userEntity;
    }
}
