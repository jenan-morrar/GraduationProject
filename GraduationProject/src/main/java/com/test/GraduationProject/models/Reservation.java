package com.test.GraduationProject.models;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@ Entity
@ Table(name ="reservations")
public class Reservation {
	@Id
	@GeneratedValue
	private Long id;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date reservationDate;
//    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="HH:mm:ss")
//    @Temporal(TemporalType.TIME)
//	private Date fromTime;
	@Transient
	private String startTime;
	@Transient
	private String endTime;
	private Time fromTime;
	private Time toTime;
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
    
	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "userSongs_id")
	private UserSongs userSongs;
	
    public Reservation() {
    	
    }
    

	public Reservation(Long id, Date reservationDate, Time fromTime, Time toTime,Date expirationDate,String status, List<ServiceOfVenue> services,Venue venue, User user, UserSongs userSongs) {
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
		this.userSongs = userSongs;
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

	public String getStartTime() {
		return startTime;
	}


	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public Time getFromTime() {
		return fromTime;
	}


	public void setFromTime(Time fromTime) {
		this.fromTime = fromTime;
	}


	public Time getToTime() {
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
	
	public UserSongs getUserSongs() {
		return userSongs;
	}


	public void setUserSongs(UserSongs userSongs) {
		this.userSongs = userSongs;
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
