package com.yafeichen.common;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by colin on 2017/2/13.
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CommResp<T> {
    public static final String SUCCESS = "success";

    public static final String SUCCESS_TEXT = "操作成功";

    public static final String ERROR = "error";

    public static final String ERROR_TEXT = "操作失败";

    // 状态
    private String status;

    // 消息
    private String message;

    // 数据
    private T data;


    /**
     * 操作失败
     */
    public static CommResp fail() {
        return CommResp.builder()
                .status(ERROR)
                .message(ERROR_TEXT)
                .build();
    }

    /**
     * 操作失败,返回指定消息
     *
     * @param message 消息
     */
    public static CommResp fail(String message) {
        return CommResp.builder()
                .status(ERROR)
                .message(message)
                .build();
    }

    /**
     * 操作成功
     */
    public static CommResp success() {
        return CommResp.builder()
                .status(SUCCESS)
                .message(SUCCESS_TEXT)
                .build();
    }


    /**
     * 操作成功,返回指定类型对象
     *
     * @param <T> 指定类型对象
     */
    public static <T> CommResp<T> success(T t) {
        return CommResp.<T>builder()
                .status(SUCCESS)
                .message(SUCCESS_TEXT)
                .data(t)
                .<T>build();
    }


    /**
     * 操作成功,返回指定消息
     *
     * @param message 消息
     */
    public static CommResp message(String message) {
        return CommResp.builder()
                .status(SUCCESS)
                .message(message)
                .build();
    }
}
