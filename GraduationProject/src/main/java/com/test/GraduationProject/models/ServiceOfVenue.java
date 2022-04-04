package com.test.GraduationProject.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "services")
public class ServiceOfVenue {

	@Id
	@GeneratedValue
	private Long id;

	private String name;
	private String description;
	private float price;

	@ManyToMany(mappedBy = "services")
	private List<Venue> venues;

	public ServiceOfVenue() {

	}

	public ServiceOfVenue(Long id, String name, String description, float price, List<Venue> venues) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.venues = venues;
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

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public List<Venue> getVenues() {
		return venues;
	}

	public void setVenues(List<Venue> venues) {
		this.venues = venues;
	}

}
