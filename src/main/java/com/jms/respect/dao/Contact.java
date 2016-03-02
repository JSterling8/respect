package com.jms.respect.dao;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "contact")
@Entity
public class Contact {
    @Id
    @SequenceGenerator(name = "contact_id_seq", sequenceName = "contact_id_seq")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "contact_id_seq")
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "report_id", referencedColumnName = "id", nullable = false)
    private Report reportId;

    @Column(name = "yes_no_club", columnDefinition = "varchar", length = 255)
    @NotNull
    private String yesNoClub;

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

    public String getYesNoClub() {
        return yesNoClub;
    }

    public void setYesNoClub(String yesNoClub) {
        this.yesNoClub = yesNoClub;
    }
}
