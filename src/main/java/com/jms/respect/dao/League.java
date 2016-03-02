package com.jms.respect.dao;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "league")
@Entity
public class League {
    @Id
    @SequenceGenerator(name = "league_id_seq", sequenceName = "league_id_seq")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "league_id_seq")
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @Column(name = "name", columnDefinition = "varchar", length = 255)
    @NotNull
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
