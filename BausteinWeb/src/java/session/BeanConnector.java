package session;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import session.BausteinBean;
import session.BausteinBeanRemote;


/**
 *
 * @author EWorster
 */
public class BeanConnector {
   public BausteinBeanRemote invokeBean(){
        try {
            final Hashtable jndiProperties = new Hashtable();
            
            jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
            
            final Context context = new InitialContext(jndiProperties);
            
            final String appName = ""; // Name einer Enterprise Application (.ear-Datei)
            
            final String moduleName = "BausteinCDT"; // Name eines EJB-Modules (.jar-Datei)
            
            final String distinctName = ""; // Spitzname für das EJB-Module
            
            final String beanName = BausteinBean.class.getSimpleName(); // Name des Beans
            
            final String viewClassName = BausteinBeanRemote.class.getName(); // Name des Interfaces
            
            
            return (BausteinBeanRemote) context.lookup("ejb:" + appName + "/" + moduleName + "/" + distinctName + "/" + beanName + "!" + viewClassName + "?stateful");
            
        } catch (NamingException ex) {
            return null;
        } 
    } 
}
