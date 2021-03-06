package com.jms.respect.dao;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "assistant")
@Entity
public class Assistant {
    @Id
    @SequenceGenerator(name = "assistant_id_seq", sequenceName = "assistant_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "assistant_id_seq")
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "report_id", referencedColumnName = "id", nullable = false)
    private Report reportId;

    @Column(name = "home_score", columnDefinition = "int2")
    @NotNull
    private Short homeScore;

    @Column(name = "away_score", columnDefinition = "int2")
    @NotNull
    private Short awayScore;

    @Column(name = "comment", columnDefinition = "varchar")
    private String comment;

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

    public Short getHomeScore() {
        return homeScore;
    }

    public void setHomeScore(Short homeScore) {
        this.homeScore = homeScore;
    }

    public Short getAwayScore() {
        return awayScore;
    }

    public void setAwayScore(Short awayScore) {
        this.awayScore = awayScore;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
