package entity;

import entity.Baustein;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-09-03T15:55:57")
@StaticMetamodel(Dozent.class)
public class Dozent_ { 

    public static volatile SingularAttribute<Dozent, String> vnameDoz;
    public static volatile SingularAttribute<Dozent, String> nnameDoz;
    public static volatile ListAttribute<Dozent, Baustein> bauList;
    public static volatile SingularAttribute<Dozent, Integer> id;

}