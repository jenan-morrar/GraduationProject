package com.test.GraduationProject.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@ Entity
@ Table(name ="userSongs")
public class UserSongs {

	@Id
	@GeneratedValue
	private Long id;
	
	private String songs;
	
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User userSongs;
	
	@OneToOne(mappedBy = "userSongs", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Reservation reservation;
	
	public UserSongs() {
		
	}
	public UserSongs(Long id, String songs, User userSongs, Reservation reservation) {
		super();
		this.id = id;
		this.songs = songs;
		this.userSongs = userSongs;
		this.reservation = reservation;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSongs() {
		return songs;
	}

	public void setSongs(String songs) {
		this.songs = songs;
	}

	public User getUserSongs() {
		return userSongs;
	}

	public void setUserSongs(User userSongs) {
		this.userSongs = userSongs;
	}

	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}


}
