package com.jms.respect.dao;
import javax.persistence.*;

@Table(name = "referee")
@Entity
public class Referee {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @Column(name = "first_name", columnDefinition = "varchar", length = 255)
    private String firstName;

    @Column(name = "last_name", columnDefinition = "varchar", length = 255)
    private String lastName;

    @Column(name = "level", columnDefinition = "int2")
    private Short level;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Short getLevel() {
        return level;
    }

    public void setLevel(Short level) {
        this.level = level;
    }
}
