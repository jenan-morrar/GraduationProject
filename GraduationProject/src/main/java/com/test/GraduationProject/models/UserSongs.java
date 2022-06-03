package com.test.GraduationProject.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

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

	public UserSongs(Long id, String songs, User userSongs) {
		super();
		this.id = id;
		this.songs = songs;
		this.userSongs = userSongs;
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
	
}
