package com.jms.respect.dao;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "captain_armband")
@Entity
public class CaptainArmband {
    @Id
    @SequenceGenerator(name = "captain_armband_id_seq", sequenceName = "captain_armband_id_seq")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "captain_armband_id_seq")
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "report_id", referencedColumnName = "id", nullable = false)
    private Report reportId;

    @Column(name = "home_away_both_neither", columnDefinition = "varchar", length = 255)
    @NotNull
    private String homeAwayBothNeither;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Report getReportId() {
        return reportId;
    }

    public void setReportId(Report reportId) {
        this.reportId = reportId;
    }

    public String getHomeAwayBothNeither() {
        return homeAwayBothNeither;
    }

    public void setHomeAwayBothNeither(String homeAwayBothNeither) {
        this.homeAwayBothNeither = homeAwayBothNeither;
    }
}
