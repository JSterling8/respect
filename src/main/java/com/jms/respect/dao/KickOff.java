package com.jms.respect.dao;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "kick_off")
@Entity
public class KickOff {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "report_id", referencedColumnName = "id", nullable = false)
    private Report reportId;

    @Column(name = "late", columnDefinition = "bool")
    @NotNull
    private boolean late;

    @Column(name = "how_late", columnDefinition = "varchar", length = 255)
    private String howLate;

    @Column(name = "fault", columnDefinition = "varchar", length = 255)
    private String fault;

    public Report getReportId() {
        return reportId;
    }

    public void setReportId(Report reportId) {
        this.reportId = reportId;
    }

    public boolean isLate() {
        return late;
    }

    public void setLate(boolean late) {
        this.late = late;
    }

    public String getHowLate() {
        return howLate;
    }

    public void setHowLate(String howLate) {
        this.howLate = howLate;
    }

    public String getFault() {
        return fault;
    }

    public void setFault(String fault) {
        this.fault = fault;
    }
}
