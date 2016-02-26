package com.jms.respect.dao;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "user")
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "referee_id", referencedColumnName = "id", nullable = false)
    private Referee refereeId;

    @Column(name = "email", columnDefinition = "varchar", length = 255, unique = true)
    @NotNull
    private String email;

    @Column(name = "password", columnDefinition = "varchar", length = 255)
    private String password;

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
}