package cn.hf.sportmeeting.interceptor.impl;

import cn.hf.sportmeeting.interceptor.FormTokenInterceptor;

import javax.servlet.http.HttpServletRequest;

/**
 * 具体规则的实现类
 * @author 韩锋
 */
public class MyFormTokenInterceptor extends FormTokenInterceptor {

    @Override
    public boolean isRepeatSubmit(HttpServletRequest request) {
        String serverToken = (String) request.getSession(false).getAttribute("formToken");
        String clinetToken = request.getParameter("formToken");
        if (serverToken == null || "".equals(serverToken)) {
            return true;
        }
        if (clinetToken == null || "".equals(clinetToken)) {
            return true;
        }
        if (!serverToken.equals(clinetToken)) {
            return true;
        }
        return false;
    }
}
