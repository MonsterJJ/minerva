package com.yafeichen.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * Created by colin on 2017/2/13.
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY,
        getterVisibility = JsonAutoDetect.Visibility.NONE,
        setterVisibility = JsonAutoDetect.Visibility.NONE)
public class DataTableResponse<T> {
    // 总记录数
    @JsonProperty(value = "iTotalDisplayRecords")
    private long iTotalDisplayRecords;

    // 总记录数
    @JsonProperty(value = "iTotalRecords")
    private long iTotalRecords;

    // 数据列表
    private List<T> aaData;
}
