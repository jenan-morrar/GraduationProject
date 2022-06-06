package com.test.GraduationProject.recommendation_system;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Scanner;
import java.util.stream.Collectors;

import org.springframework.core.io.ClassPathResource;

public class KnnClassifier {

	List<RecommendedVenue> venues;
	private double minNumOfGuests = Long.MAX_VALUE;
	private double maxNumberOfGuests = Long.MIN_VALUE;
	private double minNumberOfAvailableHalls = Long.MAX_VALUE;
	private double maxNumberOfAvailableHalls = Long.MIN_VALUE;
	private double minPrice = Double.MAX_VALUE;
	private double maxPrice = Double.MIN_VALUE;

	public KnnClassifier() throws IOException {
		upload();
	}

	public List<Long> start(Long recommendedVenueId, int k) {
		resetValues();
		findMinMaxValues();
		Optional<RecommendedVenue> recommendedVenue = venues.stream()
				.filter(venue -> venue.getId() == recommendedVenueId).findFirst();
		if (!recommendedVenue.isPresent()) {
			return venues.stream().map(venue -> venue.getId()).collect(Collectors.toList()).subList(0, k);
		}
//		RecommendedVenue venue = new RecommendedVenue(17, 700, 1, 1, 22000, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0);

		return knnMethod(recommendedVenue.get(), k);
	}

	private void resetValues() {
		minNumOfGuests = Long.MAX_VALUE;
		maxNumberOfGuests = Long.MIN_VALUE;
		minNumberOfAvailableHalls = Long.MAX_VALUE;
		maxNumberOfAvailableHalls = Long.MIN_VALUE;
		minPrice = Double.MAX_VALUE;
		maxPrice = Double.MIN_VALUE;
	}

	private void upload() throws IOException {
		File file = new ClassPathResource("static/recommendation_system_data/venues_data.txt").getFile();
		Scanner getIt = new Scanner(file);
		venues = new ArrayList<>();
		while (getIt.hasNextLine()) {
			String line = getIt.nextLine().trim();
			String[] attributes = line.split(",");
			try {
				long id = Long.parseLong(attributes[0]);
				long numberOfGuests = Long.parseLong(attributes[1]);
				long hasPark = Long.parseLong(attributes[2]);
				long numOfAvailableHalls = Long.parseLong(attributes[3]);
				double price = Double.parseDouble(attributes[4]);
				long hasDrink = Long.parseLong(attributes[5]);
				long hasCake = Long.parseLong(attributes[6]);
				long hasCamera = Long.parseLong(attributes[7]);
				long hasScreens = Long.parseLong(attributes[8]);
				long hasCatering = Long.parseLong(attributes[9]);
				long hasDJ = Long.parseLong(attributes[10]);
				long hasAppetizers = Long.parseLong(attributes[11]);
				long hasLightingSystem = Long.parseLong(attributes[12]);
				long hasAirCondition = Long.parseLong(attributes[13]);
				long hasKidsPlayArea = Long.parseLong(attributes[14]);
				long hasFlowerDecoration = Long.parseLong(attributes[15]);
				long hasPhotoShooting = Long.parseLong(attributes[16]);
				RecommendedVenue venue = new RecommendedVenue(id, numberOfGuests, hasPark, numOfAvailableHalls, price,
						hasDrink, hasCake, hasCamera, hasScreens, hasCatering, hasDJ, hasAppetizers, hasLightingSystem,
						hasAirCondition, hasKidsPlayArea, hasFlowerDecoration, hasPhotoShooting);
				venues.add(venue);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

	}

	private void findMinMaxValues() {
		venues.forEach(venue -> {
			if (venue.getNumberOfGuests() > maxNumberOfGuests) {
				maxNumberOfGuests = venue.getNumberOfGuests();
			}

			if (venue.getNumberOfGuests() < minNumOfGuests) {
				minNumOfGuests = venue.getNumberOfGuests();
			}

			if (venue.getNumOfAvailableHalls() > maxNumberOfAvailableHalls) {
				maxNumberOfAvailableHalls = venue.getNumOfAvailableHalls();
			}

			if (venue.getNumOfAvailableHalls() < minNumberOfAvailableHalls) {
				minNumberOfAvailableHalls = venue.getNumOfAvailableHalls();
			}

			if (venue.getPrice() > maxPrice) {
				maxPrice = venue.getPrice();
			}

			if (venue.getPrice() < minPrice) {
				minPrice = venue.getPrice();
			}

		});
	}

	private List<Long> knnMethod(RecommendedVenue inputVenue, int k) {
		venues.forEach(neighbourVenue -> {
			double distance = findDistance(inputVenue, neighbourVenue);
			neighbourVenue.setDistanceWithInput(distance);
		});

		Collections.sort(venues);
		return venues.stream().filter(venue -> venue.getId() != inputVenue.getId()).map(venue -> venue.getId())
				.collect(Collectors.toList()).subList(0, k);
	}

	private double findDistance(RecommendedVenue inputVenue, RecommendedVenue neighbourVenue) {
		double inputVenueScaledNumOfGuests = getScale(inputVenue.getNumberOfGuests(), minNumOfGuests,
				maxNumberOfGuests);
		double neighbourVenueScaledNumberOfGuests = getScale(neighbourVenue.getNumberOfGuests(), minNumOfGuests,
				maxNumberOfGuests);
		double diffInNumberOfGuests = inputVenueScaledNumOfGuests - neighbourVenueScaledNumberOfGuests;

		double inputVenueScaledNumOfHalls = getScale(inputVenue.getNumOfAvailableHalls(), minNumberOfAvailableHalls,
				maxNumberOfAvailableHalls);
		double neighbourVenueScaledNumOfHalls = getScale(neighbourVenue.getNumOfAvailableHalls(),
				minNumberOfAvailableHalls, maxNumberOfAvailableHalls);
		double diffInNumberOfHalls = inputVenueScaledNumOfHalls - neighbourVenueScaledNumOfHalls;

		double inputVenueScaledPrice = getScale(inputVenue.getPrice(), minPrice, maxPrice);
		double neighbourVenueScaledPrice = getScale(neighbourVenue.getPrice(), minPrice, maxPrice);
		double diffInPrice = inputVenueScaledPrice - neighbourVenueScaledPrice;

		long diffHasPark = inputVenue.getHasPark() - neighbourVenue.getHasPark();
		long diffHasDrink = inputVenue.getHasDrink() - neighbourVenue.getHasDrink();
		long diffHasCake = inputVenue.getHasCake() - neighbourVenue.getHasCake();
		long diffHasCamera = inputVenue.getHasCamera() - neighbourVenue.getHasCamera();
		long diffHasScreens = inputVenue.getHasScreens() - neighbourVenue.getHasScreens();
		long diffHasCatering = inputVenue.getHasCatering() - neighbourVenue.getHasCatering();
		long diffHasDJ = inputVenue.getHasDJ() - neighbourVenue.getHasDJ();
		long diffHasAppetizers = inputVenue.getHasAppetizers() - neighbourVenue.getHasAppetizers();
		long diffHasLight = inputVenue.getHasLightingSystem() - neighbourVenue.getHasLightingSystem();
		long diffCondition = inputVenue.getHasAirCondition() - neighbourVenue.getHasAirCondition();
		long diffPlayArea = inputVenue.getHasKidsPlayArea() - neighbourVenue.getHasKidsPlayArea();
		long diffFlower = inputVenue.getHasFlowerDecoration() - neighbourVenue.getHasFlowerDecoration();
		long diffPhotoShooting = inputVenue.getHasPhotoShooting() - neighbourVenue.getHasPhotoShooting();
		return Math.sqrt(Math.pow(diffInNumberOfGuests, 2) + Math.pow(diffInNumberOfHalls, 2) + Math.pow(diffInPrice, 2)
				+ Math.pow(diffHasPark, 2) + Math.pow(diffHasDrink, 2) + Math.pow(diffHasCake, 2)
				+ Math.pow(diffHasCamera, 2) + Math.pow(diffHasScreens, 2) + Math.pow(diffHasCatering, 2)
				+ Math.pow(diffHasDJ, 2) + Math.pow(diffHasAppetizers, 2) + Math.pow(diffHasLight, 2)
				+ Math.pow(diffCondition, 2) + Math.pow(diffPlayArea, 2) + Math.pow(diffFlower, 2)
				+ Math.pow(diffPhotoShooting, 2));

	}

	// min max scale
	private double getScale(double value, double min, double max) {
		return (value - min) / (max - min);
	}
}
