package com.jms.respect.dao;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "team_sheet")
@Entity
public class TeamSheet {
    @Id
    @SequenceGenerator(name = "team_sheet_id_seq", sequenceName = "team_sheet_id_seq")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "team_sheet_id_seq")
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "report_id", referencedColumnName = "id", nullable = false)
    private Report reportId;

    @Column(name = "recieved", columnDefinition = "varchar", length = 255)
    @NotNull
    private String recieved;

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

    public String getRecieved() {
        return recieved;
    }

    public void setRecieved(String recieved) {
        this.recieved = recieved;
    }
}
