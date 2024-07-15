/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Enum.java to edit this template
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author Desktop
 */
public enum Role implements Serializable{
    Admin("/BanAccountController"), 
    Coach("/COACH/CoachWelcome.jsp"), 
    Player("/PLAYER/PlayerDashboard"), 
    Medical("/MEDICAL/medicalPage.jsp"),
    User("/HomeServlet"),
    SalesMan("/TicketServlet");
    
    Role(String homePage) {
        this.homePage = homePage;
    }
    
    private final String homePage;

    
    public String getHomePage() {
        return this.homePage;
    }
    
}
