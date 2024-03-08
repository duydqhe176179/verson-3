/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Request {

    private int idRequest, idMentee, idMentor;
    private String fullname;
    private String title, content, skill, status, startDate, deadline;
    private float hour;
    private String reasonReject;
    private String deadlineDate;
    private BigDecimal deadlineHour;
    int totalCost;

    public Request() {
    }

    public int getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(int totalCost) {
        this.totalCost = totalCost;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public float getHour() {
        return hour;
    }

    public void setHour(float hour) {
        this.hour = hour;
    }

    public Request(int idRequest, int idMentee, int idMentor, String fullname, String title, String content, String skill, String status, String startDate, String deadline, float hour) {
        this.idRequest = idRequest;
        this.idMentee = idMentee;
        this.idMentor = idMentor;
        this.fullname = fullname;
        this.title = title;
        this.content = content;
        this.skill = skill;
        this.status = status;
        this.startDate = startDate;
        this.deadline = deadline;
        this.hour = hour;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getReasonReject() {
        return reasonReject;
    }

    public void setReasonReject(String reasonReject) {
        this.reasonReject = reasonReject;
    }

  
    public Request(int idRequest, int idMentee, int idMentor, String title, String content, String skill, String status, String deadline, float hour) {
        this.idRequest = idRequest;
        this.idMentee = idMentee;
        this.idMentor = idMentor;
        this.title = title;
        this.content = content;
        this.skill = skill;
        this.status = status;
        this.deadline = deadline;
        this.hour = hour;
    }

    public Request(int idRequest, int idMentee, int idMentor, String title, String content, String skill, String status, String deadlineDate, BigDecimal deadlineHour,int totalCost) {
        this.idRequest = idRequest;
        this.idMentee = idMentee;
        this.idMentor = idMentor;
        this.title = title;
        this.content = content;
        this.skill = skill;
        this.status = status;
        this.deadlineDate = deadlineDate;
        this.deadlineHour = deadlineHour;
        this.totalCost=totalCost;
    }

    public Request(int idMentee, int idMentor, String title, String content, String skill, String status, String deadline, float hour) {
        this.idMentee = idMentee;
        this.idMentor = idMentor;
        this.title = title;
        this.content = content;
        this.skill = skill;
        this.status = status;
        this.deadline = deadline;
        this.hour = hour;
    }

    public Request(int idRequest, int idMentee, int idMentor, String title, String content, String skill, String status, String startDate, String deadline, float hour) {
        this.idRequest = idRequest;
        this.idMentee = idMentee;
        this.idMentor = idMentor;
        this.title = title;
        this.content = content;
        this.skill = skill;
        this.status = status;
        this.startDate = startDate;
        this.deadline = deadline;
        this.hour = hour;
    }

    public int getIdRequest() {
        return idRequest;
    }

    public void setIdRequest(int idRequest) {
        this.idRequest = idRequest;
    }

    public int getIdMentee() {
        return idMentee;
    }

    public void setIdMentee(int idMentee) {
        this.idMentee = idMentee;
    }

    public int getIdMentor() {
        return idMentor;
    }

    public void setIdMentor(int idMentor) {
        this.idMentor = idMentor;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDeadlineDate() {
        return deadlineDate;
    }

    public void setDeadlineDate(String deadlineDate) {
        this.deadlineDate = deadlineDate;
    }

    public BigDecimal getDeadlineHour() {
        return deadlineHour;
    }

    public void setDeadlineHour(BigDecimal deadlineHour) {
        this.deadlineHour = deadlineHour;
    }

    @Override
    public String toString() {
        return "Request{" + "idRequest=" + idRequest + ", idMentee=" + idMentee + ", idMentor=" + idMentor + ", title=" + title + ", content=" + content + ", skill=" + skill + ", status=" + status + ", startDate=" + startDate + ", deadline=" + deadline + ", hour=" + hour + ", deadlineDate=" + deadlineDate + ", deadlineHour=" + deadlineHour + '}';
    }

}
