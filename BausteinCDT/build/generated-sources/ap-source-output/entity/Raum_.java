package entity;

import entity.Termine;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-09-03T15:55:57")
@StaticMetamodel(Raum.class)
public class Raum_ { 

    public static volatile SingularAttribute<Raum, String> platzAnz;
    public static volatile ListAttribute<Raum, Termine> datList;
    public static volatile SingularAttribute<Raum, Integer> rid;
    public static volatile SingularAttribute<Raum, String> raumNr;

}