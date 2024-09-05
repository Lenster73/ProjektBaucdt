package entity;

import entity.Teilnehmer;
import entity.Termine;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-09-03T15:55:57")
@StaticMetamodel(Klassen.class)
public class Klassen_ { 

    public static volatile SingularAttribute<Klassen, String> klassKurz;
    public static volatile ListAttribute<Klassen, Termine> datList;
    public static volatile SingularAttribute<Klassen, Integer> id;
    public static volatile ListAttribute<Klassen, Teilnehmer> tnList;

}