package com.dcx.blog.vo.params;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author：小清流吖 DCX
 * @date：2022/10/12 21:27
 * @description：
 */
@Data
@AllArgsConstructor
public class Result {
    private boolean success;
    private int code;
    private String msg;
    private Object data;

    public static Result success(Object data){
        return new Result(true, 200,"success", data);
    }
    public static Result fail(int code,String msg){
        return new Result(false,code,msg,null);
    }

}
