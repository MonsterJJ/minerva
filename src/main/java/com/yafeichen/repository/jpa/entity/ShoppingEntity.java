package com.yafeichen.repository.jpa.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by colin on 2017/2/13.
 */

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "shopping")
public class ShoppingEntity {
    @Id
    @Column(name = "shopping_id")
    private String shoppingId;

    @Column(name = "shopping_name")
    private String shoppingName;

    @Column(name = "shopping_url")
    private String shoppingUrl;

    @Column(name = "shopping_image_url")
    private String shoppingImageUrl;

    @Column(name = "remark")
    private String remark;
}
