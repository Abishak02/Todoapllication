package com.example.ToDoApp.Model;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.annotation.Generated;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table (name="todo")
public class Todo {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    private long id;
	@Column
    private String title;
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
	@Column
    private String status;
	@Column
    private String Notes;



public Todo() {
	 
 }

public long getId() {
	return id;
}

public void setId(long id) {
	this.id = id;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public Date getDate() {
	return date;
}

public void setDate(Date date) {
	this.date = date;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}
public String getNotes() {
	return Notes;
}

public void setNotes(String notes) {
	Notes = notes;
}
}
