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
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    @JoinTable(
        name = "venues_services", 
        joinColumns = @JoinColumn(name = "venue_id"), 
        inverseJoinColumns = @JoinColumn(name = "service_id"))
    private Set<ServiceOfVenue> services;
    
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    @JoinTable(
        name = "venues_images", 
        joinColumns = @JoinColumn(name = "venue_id"), 
        inverseJoinColumns = @JoinColumn(name = "image_id"))
    private Set<Images> images;
    
    public Venue() {
    	
    }
    
    public Venue(Long id, String name, String description, String location, float price, Set<ServiceOfVenue> services,Set<Images> images) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.location = location;
		this.price = price;
		this.services = services;
		this.images = images;
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

	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
