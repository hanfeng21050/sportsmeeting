package cn.hf.sportmeeting.dao;

import cn.hf.sportmeeting.domain.Grade;
import cn.hf.sportmeeting.domain.GradeExample;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class Demo1 {
    @Test
    public void demo1() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        GradeMapper mapper = context.getBean(GradeMapper.class);

        Grade grade = new Grade();
        grade.setRank(1);
        GradeExample example = new GradeExample();
        example.createCriteria().andAthleteIdEqualTo(1);

        mapper.updateByExampleSelective(grade,example);

    }
}
