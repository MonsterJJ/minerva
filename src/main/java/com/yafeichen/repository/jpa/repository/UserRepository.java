package com.yafeichen.repository.jpa.repository;

import com.yafeichen.repository.jpa.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by colin on 2017/2/11.
 */

@Repository
public interface UserRepository extends CrudRepository<UserEntity, String>, JpaSpecificationExecutor<UserEntity> {
    List<UserEntity> findByUserNameAndUserPassword(String userName, String userPassword);
}
