package entity;

import entity.Klassen;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import service.Gender;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-09-03T15:55:57")
@StaticMetamodel(Teilnehmer.class)
public class Teilnehmer_ { 

    public static volatile SingularAttribute<Teilnehmer, String> tnOrt;
    public static volatile SingularAttribute<Teilnehmer, String> tnJCNummer;
    public static volatile SingularAttribute<Teilnehmer, Gender> gender;
    public static volatile SingularAttribute<Teilnehmer, String> tnEmail;
    public static volatile SingularAttribute<Teilnehmer, String> verNr;
    public static volatile SingularAttribute<Teilnehmer, String> ist;
    public static volatile SingularAttribute<Teilnehmer, String> tnAbschluss;
    public static volatile SingularAttribute<Teilnehmer, String> tnVname;
    public static volatile SingularAttribute<Teilnehmer, String> tnPlz;
    public static volatile SingularAttribute<Teilnehmer, String> tnTelNr;
    public static volatile SingularAttribute<Teilnehmer, Klassen> kls;
    public static volatile SingularAttribute<Teilnehmer, String> tnStrNr;
    public static volatile SingularAttribute<Teilnehmer, String> tnNname;
    public static volatile SingularAttribute<Teilnehmer, String> tnBerater;
    public static volatile SingularAttribute<Teilnehmer, String> kurs;
    public static volatile SingularAttribute<Teilnehmer, Integer> id;
    public static volatile SingularAttribute<Teilnehmer, String> tnGebort;
    public static volatile SingularAttribute<Teilnehmer, String> tnNation;
    public static volatile SingularAttribute<Teilnehmer, String> tnGeb;
    public static volatile SingularAttribute<Teilnehmer, String> tnBeruf;

}