package com.yafeichen.repository.jpa.repository;

import com.yafeichen.repository.jpa.entity.ShoppingEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by colin on 2017/2/15.
 */

@Repository
public interface ShoppingRespository extends CrudRepository<ShoppingEntity,String>,JpaSpecificationExecutor<ShoppingEntity> {
    List<ShoppingEntity> findAll();
}
