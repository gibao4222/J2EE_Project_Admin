/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class PermissionModel {
    private String idPermission,namePermission,portray;

    public PermissionModel() {
    }

    public PermissionModel(String idPermission, String namePermission, String portray) {
        this.idPermission = idPermission;
        this.namePermission = namePermission;
        this.portray = portray;
    }

    public String getIdPermission() {
        return idPermission;
    }

    public void setIdPermission(String idPermission) {
        this.idPermission = idPermission;
    }

    public String getNamePermission() {
        return namePermission;
    }

    public void setNamePermission(String namePermission) {
        this.namePermission = namePermission;
    }

    public String getPortray() {
        return portray;
    }

    public void setPortray(String potray) {
        this.portray = potray;
    }
    
}
