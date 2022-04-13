package com.test.GraduationProject.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "images")
public class Images {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	private String image;

	@ManyToMany(mappedBy = "images")
	private List<Venue> venues;

	public Images() {

	}

	public Images(Long id, String image, List<Venue> venues) {
		super();
		this.id = id;
		this.image = image;
		this.venues = venues;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<Venue> getVenues() {
		return venues;
	}

	public void setVenues(List<Venue> venues) {
		this.venues = venues;
	}

//	@Transient
//	public String getPhotosImagePath() {
//		if (image == null || id == null)
//			return null;
//
//		return "/user-photos/" + 1 + "/" + image;
//	}

}
