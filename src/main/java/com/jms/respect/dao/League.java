package com.jms.respect.dao;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "league")
@Entity
public class League {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @Column(name = "name", columnDefinition = "varchar", length = 255)
    @NotNull
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
