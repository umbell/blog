package com.dcx.blog.impl;

import com.alibaba.fastjson.JSON;
import com.dcx.blog.dao.pojo.SysUser;
import com.dcx.blog.service.LoginService;
import com.dcx.blog.service.SysUserService;
import com.dcx.blog.utils.JWTUtils;
import com.dcx.blog.vo.ErrorCode;
import com.dcx.blog.vo.params.LoginParam;
import com.dcx.blog.vo.params.Result;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @author：小清流吖 DCX
 * @date：2022/11/1 22:09
 * @description：
 */
@Service
@Transactional
public class LoginServiceImpl implements LoginService {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    private static final String slat = "dcx!@#$";
    @Override
    public Result login(LoginParam loginParam) {
        String account = loginParam.getAccount();
        String password = loginParam.getPassword();
        if(StringUtils.isBlank(account) || StringUtils.isBlank(password)){
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(),ErrorCode.PARAMS_ERROR.getMsg());
        }
        //用md5加密，用密码 + slat（加密盐）
        //DigestUtils 来源于
        // <dependency>
        //   <groupId>commons-codec</groupId>
        //   <artifactId>commons-codec</artifactId>
        //</dependency>
        password = DigestUtils.md5Hex(password + slat);
//        password = DigestUtils.md5Hex(password);
//        System.out.println(password);
        //从数据库查询用户名，密码
        SysUser sysUser = sysUserService.findUser(account,password);
        if(sysUser == null){
            return Result.fail(ErrorCode.ACCOUNT_PWD_NOT_EXIST.getCode(),ErrorCode.ACCOUNT_PWD_NOT_EXIST.getMsg());
        }
        //创建令牌
        String token = JWTUtils.createToken(sysUser.getId());
        //将令牌放进redis中，并且设置过期时间
        redisTemplate.opsForValue().set("TOKEN_" + token, JSON.toJSONString(sysUser),1, TimeUnit.DAYS);
//        UserThreadLocal.put(sysUser);
        return Result.success(token);
    }

    //检查token
    @Override
    public SysUser checkToken(String token) {
        if(StringUtils.isBlank(token)){
            return null;
        }
        Map<String, Object> stringObjectMap = JWTUtils.checkToken(token);
        if(stringObjectMap == null){
            return null;
        }
        String userJson = redisTemplate.opsForValue().get("TOKEN_" + token);
        if(StringUtils.isBlank(userJson)){
            return null;
        }
        SysUser sysUser = JSON.parseObject(userJson, SysUser.class);
        return sysUser;
    }

    @Override
    public Result logout(String token) {
        redisTemplate.delete("TOKEN_" + token);
        return Result.success(null);
    }

//    注册登录
    @Override
    public Result register(LoginParam loginParam) {
//        1.判断注册参数是否合法
//        2.判断账户是否存在,如果存在,就返回
//        不存在,就注册
//        存入redis
//        添加事务,防止注册到一半,注册不成功,回滚事务
        String account = loginParam.getAccount();
        String password = loginParam.getPassword();
        String nickname = loginParam.getNickname();
        if(StringUtils.isBlank(account)
                || StringUtils.isBlank(password)
                || StringUtils.isBlank(nickname)){
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        }
        SysUser sysUser = sysUserService.findUserByAccount(account);
        if(sysUser != null){
            return Result.fail(ErrorCode.ACCOUNT_EXIST.getCode(),ErrorCode.ACCOUNT_EXIST.getMsg());
        }
        sysUser = new SysUser();
        sysUser.setNickname(nickname);
        sysUser.setAccount(account);
        //密码盐要和登录一致
        sysUser.setPassword(DigestUtils.md5Hex(password+slat));
        sysUser.setCreateDate(System.currentTimeMillis());
        sysUser.setLastLogin(System.currentTimeMillis());
        sysUser.setAvatar("/static/img/user.png");
        sysUser.setAdmin(1); //1 为true
        sysUser.setDeleted(0); // 0 为false
        sysUser.setSalt("");
        sysUser.setStatus("");
        sysUser.setEmail("");
        this.sysUserService.save(sysUser);

        String token = JWTUtils.createToken(sysUser.getId());
        redisTemplate.opsForValue().set("TOKEN_" + token, JSON.toJSONString(sysUser),1, TimeUnit.DAYS);
//        UserThreadLocal.put(sysUser);
        return Result.success(token);
    }
}
