package com.jms.respect.service;

import com.jms.respect.dao.Team;
import com.jms.respect.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 12/03/2016.
 */
@Service
public class TeamService {
    private final TeamRepository teamRepository;

    @Autowired
    public TeamService(TeamRepository teamRepository) {
        this.teamRepository = teamRepository;
    }

    public Team getTeamById(Integer id) {
        return teamRepository.findById(id);
    }
}
