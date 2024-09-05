package entity;

import entity.Dozent;
import entity.Termine;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-09-03T15:55:57")
@StaticMetamodel(Baustein.class)
public class Baustein_ { 

    public static volatile SingularAttribute<Baustein, Integer> bauTage;
    public static volatile SingularAttribute<Baustein, String> bauBeschr;
    public static volatile SingularAttribute<Baustein, String> bauid;
    public static volatile ListAttribute<Baustein, Termine> bauList;
    public static volatile SingularAttribute<Baustein, Dozent> doz;

}