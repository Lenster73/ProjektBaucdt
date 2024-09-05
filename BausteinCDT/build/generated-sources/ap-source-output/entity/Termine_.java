package entity;

import entity.Baustein;
import entity.Klassen;
import entity.Raum;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-09-03T15:55:57")
@StaticMetamodel(Termine.class)
public class Termine_ { 

    public static volatile SingularAttribute<Termine, Raum> raum;
    public static volatile SingularAttribute<Termine, Klassen> kls;
    public static volatile SingularAttribute<Termine, String> endeBau;
    public static volatile SingularAttribute<Termine, Baustein> bau;
    public static volatile SingularAttribute<Termine, String> startBau;
    public static volatile SingularAttribute<Termine, Integer> id;

}