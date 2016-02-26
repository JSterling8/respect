package com.jms.respect.dao;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "contact")
@Entity
public class Contact {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "report_id", referencedColumnName = "id", nullable = false)
    private Report reportId;

    @Column(name = "yes_no_club", columnDefinition = "varchar", length = 255)
    @NotNull
    private String yesNoClub;

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
