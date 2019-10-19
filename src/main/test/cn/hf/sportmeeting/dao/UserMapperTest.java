package cn.hf.sportmeeting.dao;

import cn.hf.sportmeeting.domain.UserInfo;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

import static org.junit.Assert.*;

public class UserMapperTest {

    @Test
    public void selectUserNotInAthlete() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserMapper mapper = context.getBean(UserMapper.class);

        List<UserInfo> userInfos = mapper.selectUserNotInAthlete();

        for (UserInfo userInfo : userInfos) {
            System.out.println(userInfo);
        }
    }
}