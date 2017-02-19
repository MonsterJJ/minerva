package com.yafeichen.controller;

import com.yafeichen.common.CommResp;
import com.yafeichen.model.DataTableResponse;
import com.yafeichen.repository.jpa.entity.ShoppingEntity;
import com.yafeichen.repository.jpa.repository.ShoppingRespository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by colin on 2017/2/13.
 */

@Slf4j
@Controller
@RequestMapping("/shopping")
public class ShoppingController {

    @Resource
    private ShoppingRespository shoppingRespository;

    @RequestMapping("/list")
    @ResponseBody
    public CommResp<DataTableResponse<ShoppingEntity>> queryShoppingList() {
        log.info("kkkkkkkk");
        List<ShoppingEntity> shoppingEntityList = shoppingRespository.findAll();

        return CommResp.<DataTableResponse<ShoppingEntity>>builder()
                .status("success").message("查询列表成功")
                .data(DataTableResponse.<ShoppingEntity>builder()
                        .iTotalDisplayRecords(shoppingEntityList.size())
                        .iTotalRecords(shoppingEntityList.size())
                        .aaData(shoppingEntityList).build())
                .build();
    }

    @RequestMapping(value = "/save/index", method = RequestMethod.GET)
    public String legalShoppingSaveIndex(Model model) {
        return "legal_shopping_edit";
    }

    @ResponseBody
    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public CommResp newShopping(ShoppingEntity shoppingEntity) {
        ShoppingEntity entity = shoppingRespository.findOne(shoppingEntity.getShoppingId());
        if (entity != null) {
            return CommResp.fail("商品编码已经存在");
        }
        ShoppingEntity saveEntity = shoppingRespository.save(shoppingEntity);
        if (saveEntity != null) {
            return CommResp.success(saveEntity.getShoppingId());
        } else {
            return CommResp.fail("保存失败");
        }
    }

    @RequestMapping(value = "/delete/index/{shoppingID}", method = RequestMethod.GET)
    public String deleteShoppingIndex(@PathVariable String shoppingID, Model model) {
        ShoppingEntity shoppingEntity = shoppingRespository.findOne(shoppingID);
        model.addAttribute("shoppingEntity", shoppingEntity);
        return "shopping_delete";
    }

    @RequestMapping(value = "/delete/{shoppingId}", method = RequestMethod.POST)
    @ResponseBody
    public CommResp deleteShopping(@PathVariable String shoppingId) {
        ShoppingEntity entity = shoppingRespository.findOne(shoppingId);
        shoppingRespository.delete(entity);
        return CommResp.message("删除商品成功");
    }

    @RequestMapping(value = "/edit/index/{shoppingID}", method = RequestMethod.GET)
    public String editContacterIndex(@PathVariable String shoppingID, Model model) {
        ShoppingEntity shoppingEntity = shoppingRespository.findOne(shoppingID);
        model.addAttribute("shoppingEntity", shoppingEntity);
        return "legal_shopping_edit";
    }
}
