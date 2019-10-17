package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.domain.AthleteTeam;
import cn.hf.sportmeeting.domain.Team;
import cn.hf.sportmeeting.service.TeamService;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class TeamServiceImplTest {

    @Test
    public void getIds() {
        List<AthleteTeam> list = new ArrayList<>();
        AthleteTeam a1 = new AthleteTeam();
        AthleteTeam a2 = new AthleteTeam();
        AthleteTeam a3 = new AthleteTeam();

        a1.setAthleteId(1);
        a2.setAthleteId(2);
        a3.setAthleteId(3);
        list.add(a1);
        list.add(a2);
        list.add(a3);

        TeamServiceImpl t = new TeamServiceImpl();
        List<Integer> getAthleteId = t.getIds(list, "getAthleteId");
        System.out.println(getAthleteId);
    }
}