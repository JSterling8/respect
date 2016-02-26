package com.jms.respect.dao;

import javax.persistence.*;

@Table(name = "competition")
@Entity
public class Competition {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "league", referencedColumnName = "id", nullable = false)
    private League league;

    @Column(name = "name", columnDefinition = "varchar", length = 255)
    private String name;

    public League getLeague() {
        return league;
    }

    public void setLeague(League league) {
        this.league = league;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
