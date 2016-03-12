package com.jms.respect.service;

import com.google.common.collect.Lists;
import com.jms.respect.dao.Competition;
import com.jms.respect.dao.League;
import com.jms.respect.repository.CompetitionRepository;
import com.jms.respect.repository.LeagueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.TreeMap;
import java.util.stream.Collectors;

/**
 * Created by anon on 12/03/2016.
 */
@Service
public class CompetitionService {
    private final CompetitionRepository competitionRepository;
    private final LeagueRepository leagueRepository;

    @Autowired
    public CompetitionService(CompetitionRepository competitionRepository, LeagueRepository leagueRepository) {
        this.competitionRepository = competitionRepository;
        this.leagueRepository = leagueRepository;
    }

    public TreeMap<League, List<Competition>> getCompetitionsByLeague() {
        TreeMap<League, List<Competition>> competitionsByLeague = new TreeMap<>(new LeagueComparator());
        List<League> leagues = Lists.newArrayList(leagueRepository.findAll());

        for(League league : leagues) {
            List<Competition> competitionsForLeague = competitionRepository.findByLeague(league);
            competitionsForLeague = competitionsForLeague
                    .stream()
                    .sorted((c1, c2) -> c1.getName().compareTo(c2.getName()))
                    .collect(Collectors.toList());
            competitionsByLeague.put(league, competitionsForLeague);
        }

        return competitionsByLeague;
    }

    private class LeagueComparator implements Comparator<League> {
        @Override
        public int compare(League o1, League o2) {
            return o1.getName().compareTo(o2.getName());
        }
    }
}
