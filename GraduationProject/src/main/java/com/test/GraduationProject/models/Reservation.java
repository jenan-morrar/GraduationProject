package com.test.GraduationProject.models;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@ Entity
@ Table(name ="reservations")
public class Reservation {
	@Id
	@GeneratedValue
	private Long id;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date reservationDate;
	@DateTimeFormat(pattern = "hh:mm:ss")
	private Date fromTime;
	@DateTimeFormat(pattern = "hh:mm:ss")
	private Date toTime;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date expirationDate;
	private String status;
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "reservation_services", 
        joinColumns = @JoinColumn(name = "reservation_id"), 
        inverseJoinColumns = @JoinColumn(name = "service_id")
    )
    private List<ServiceOfVenue> services;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="venue_id")
    private Venue venue;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;

    public Reservation() {
    	
    }
    

	public Reservation(Long id, Date reservationDate, Time fromTime, Time toTime,Date expirationDate,String status, List<ServiceOfVenue> services,Venue venue, User user) {
		super();
		this.id = id;
		this.reservationDate = reservationDate;
		this.fromTime = fromTime;
		this.toTime = toTime;
		this.expirationDate = expirationDate;
		this.status = status;
		this.services=services;
		this.venue = venue;
		this.user = user;
	}


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Date getReservationDate() {
		return reservationDate;
	}


	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}


	public Date getFromTime() {
		return fromTime;
	}


	public void setFromTime(Time fromTime) {
		this.fromTime = fromTime;
	}


	public Date getToTime() {
		return toTime;
	}


	public void setToTime(Time toTime) {
		this.toTime = toTime;
	}
    
	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	public List<ServiceOfVenue> getServices() {
		return services;
	}

	public void setServices(List<ServiceOfVenue> services) {
		this.services = services;
	}


	public Venue getVenue() {
		return venue;
	}
	public void setVenue(Venue venue) {
		this.venue = venue;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
    
}
