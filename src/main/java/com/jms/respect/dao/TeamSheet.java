package com.jms.respect.dao;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "team_sheet")
@Entity
public class TeamSheet {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "report_id", referencedColumnName = "id", nullable = false)
    private Report reportId;

    @Column(name = "recieved", columnDefinition = "varchar", length = 255)
    @NotNull
    private String recieved;

    public Report getReportId() {
        return reportId;
    }

    public void setReportId(Report reportId) {
        this.reportId = reportId;
    }

    public String getRecieved() {
        return recieved;
    }

    public void setRecieved(String recieved) {
        this.recieved = recieved;
    }
}
