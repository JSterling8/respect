package com.jms.respect.dao;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "home_hospitality")
@Entity
public class HomeHospitality {
    @Id
    @SequenceGenerator(name = "home_hospitality_id_seq", sequenceName = "home_hospitality_id_seq")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "home_hospitality_id_seq")
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "report_id", referencedColumnName = "id", nullable = false)
    private Report reportId;

    @Column(name = "score", columnDefinition = "int2")
    @NotNull
    private Short score;

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

    public Short getScore() {
        return score;
    }

    public void setScore(Short score) {
        this.score = score;
    }
}
