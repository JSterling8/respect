package com.jms.respect.dao;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Table(name = "use")
@Entity
public class User {
    @Id
    @SequenceGenerator(name = "user_id_seq", sequenceName = "user_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_id_seq")
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "referee_id", referencedColumnName = "id", nullable = false)
    private Referee refereeId;

    @Column(name = "email", columnDefinition = "varchar", length = 255, unique = true)
    @NotNull
    private String email;

    @Column(name = "password", columnDefinition = "varchar", length = 255)
    @NotNull
    private String password;

    @Column(name = "type", columnDefinition = "varchar", length = 255)
    @NotNull
    private String type;

    @Column(name = "created", columnDefinition = "date")
    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date created;

    @Column(name = "approved", columnDefinition = "bool")
    @NotNull
    private Boolean approved;

    @Column(name = "remind", columnDefinition = "bool")
    @NotNull
    private Boolean remind;

    @Column(name = "validated", columnDefinition = "bool")
    @NotNull
    private Boolean validated;

    @Column(name = "validation_code", columnDefinition = "varchar", length = 1027)
    private String validationCode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Referee getRefereeId() {
        return refereeId;
    }

    public void setRefereeId(Referee refereeId) {
        this.refereeId = refereeId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Boolean getApproved() {
        return approved;
    }

    public void setApproved(Boolean approved) {
        this.approved = approved;
    }

    public Boolean getRemind() {
        return remind;
    }

    public void setRemind(Boolean remind) {
        this.remind = remind;
    }

    public Boolean getValidated() {
        return validated;
    }

    public void setValidated(Boolean validated) {
        this.validated = validated;
    }

    public String getValidationCode() {
        return validationCode;
    }

    public void setValidationCode(String validationCode) {
        this.validationCode = validationCode;
    }
}
