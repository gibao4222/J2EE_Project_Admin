/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class PermissionGroupModel {
    private String idGroup,nameGroup,portray,listPermission;

    public PermissionGroupModel() {
    }

    public PermissionGroupModel(String nameGroup, String portray, String listPermission) {
        this.nameGroup = nameGroup;
        this.portray = portray;
        this.listPermission = listPermission;
    }

    public PermissionGroupModel(String idGroup, String nameGroup, String portray, String listPermission) {
        this.idGroup = idGroup;
        this.nameGroup = nameGroup;
        this.portray = portray;
        this.listPermission = listPermission;
    }

    public String getIdGroup() {
        return idGroup;
    }

    public void setIdGroup(String idGroup) {
        this.idGroup = idGroup;
    }

    public String getNameGroup() {
        return nameGroup;
    }

    public void setNameGroup(String nameGroup) {
        this.nameGroup = nameGroup;
    }

    public String getPortray() {
        return portray;
    }

    public void setPortray(String portray) {
        this.portray = portray;
    }

    public String getListPermission() {
        return listPermission;
    }

    public void setListPermission(String listPermission) {
        this.listPermission = listPermission;
    }
    
}
