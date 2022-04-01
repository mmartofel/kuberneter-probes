package org.acme;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

@Entity
@Table(name = "person_data")
public class Person extends PanacheEntity {
    
    @Column(length = 30)
    public String name;

    @Column(length = 50)
    public String surname;

    @Column(length = 11)
    public String pesel;

}
