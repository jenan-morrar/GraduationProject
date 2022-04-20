package com.test.GraduationProject.models;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "venues")
public class Venue {

	@Id
	@GeneratedValue
	private Long id;

	private String name;
	private String description;
	private String location;
	private float price;
	@Column(length = 2048)
	private String mapOne;
	@Column(length = 2048)
	private String mapTwo;
	private int numOfGuests;
	private String venuePark;
	private String venueContact;
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	@JoinTable(name = "venues_services", joinColumns = @JoinColumn(name = "venue_id"), inverseJoinColumns = @JoinColumn(name = "service_id"))
	private Set<ServiceOfVenue> services;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	@JoinTable(name = "venues_images", joinColumns = @JoinColumn(name = "venue_id"), inverseJoinColumns = @JoinColumn(name = "image_id"))
	private Set<Images> images;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
    @OneToMany(mappedBy="venue", fetch = FetchType.LAZY)
    private List<Reservation> reservations;

	public Venue() {

	}

	public Venue(Long id, String name, String description, String location, float price, String mapOne, String mapTwo,
			int numOfGuests, String venuePark, String venueContact, Set<ServiceOfVenue> services, Set<Images> images,
			User user) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.location = location;
		this.price = price;
		this.mapOne = mapOne;
		this.mapTwo = mapTwo;
		this.numOfGuests = numOfGuests;
		this.venuePark = venuePark;
		this.venueContact = venueContact;
		this.services = services;
		this.images = images;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getMapOne() {
		return mapOne;
	}

	public void setMapOne(String mapOne) {
		this.mapOne = mapOne;
	}

	public String getMapTwo() {
		return mapTwo;
	}

	public void setMapTwo(String mapTwo) {
		this.mapTwo = mapTwo;
	}

	public int getNumOfGuests() {
		return numOfGuests;
	}

	public void setNumOfGuests(int numOfGuests) {
		this.numOfGuests = numOfGuests;
	}

	public String getVenuePark() {
		return venuePark;
	}

	public void setVenuePark(String venuePark) {
		this.venuePark = venuePark;
	}

	public String getVenueContact() {
		return venueContact;
	}

	public void setVenueContact(String venueContact) {
		this.venueContact = venueContact;
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

	public Set<ServiceOfVenue> getServices() {
		return services;
	}

	public void setServices(Set<ServiceOfVenue> services) {
		this.services = services;
	}

	public Set<Images> getImages() {
		return images;
	}

	public void setImages(Set<Images> images) {
		this.images = images;
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
