package com.dyh.Bean;

import java.util.List;

/**
 * @author daiyuhua
 */
public class RespPageBean {
    private Integer total;
    private List<?> data;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "RespPageBean{" +
                "total=" + total +
                ", data=" + data +
                '}';
    }
}
