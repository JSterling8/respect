package com.jms.respect.dao;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "shirt")
@Entity
public class Shirt {
    @Id
    @SequenceGenerator(name = "shirt_id_seq", sequenceName = "shirt_id_seq")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "shirt_id_seq")
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "report_id", referencedColumnName = "id", nullable = false)
    private Report reportId;

    @Column(name = "did_wear", columnDefinition = "varchar", length = 255)
    @NotNull
    private String didWear;

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

    public String getDidWear() {
        return didWear;
    }

    public void setDidWear(String didWear) {
        this.didWear = didWear;
    }
}
