/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import JavaSrc.Connections;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author knight
 */
public class SearchAction extends ActionSupport {
    private String searchtext ;
    ArrayList<Files> file2 = new ArrayList<Files>();

    public ArrayList<Files> getFile2() {
        return file2;
    }

    public void setFile2(ArrayList<Files> file2) {
        this.file2 = file2;
    }
    
    public String getSearchtext() {
        return searchtext;
    }

    public void setSearchtext(String searchtext) {
        this.searchtext = searchtext;
    }
    
    public SearchAction() {
    }
    
    public String execute() throws Exception {
       Connection con = Connections.conn();
        Statement ps = con.createStatement();
        ResultSet rs = ps.executeQuery("select filename,filetags,filedescription ,idfiles from files where filename='" + searchtext + "'");

        while (rs.next()) {
            Files f = new Files();
            f.setFilename(rs.getString(1));
            f.setFiletags(rs.getString(2));
            f.setFiledes(rs.getString(3));
            f.setIdfiles(rs.getString(4));
            file2.add(f);
        }
        con.close();
        return "success";
    }
    
}