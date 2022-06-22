package com.test.GraduationProject.services;

import java.sql.Time;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.test.GraduationProject.models.Reservation;
import com.test.GraduationProject.models.User;
import com.test.GraduationProject.models.UserSongs;
import com.test.GraduationProject.models.Venue;
import com.test.GraduationProject.repositories.ReservationRepository;

@Service
public class ReservationService {

	private ReservationRepository reservationRepository;

	public ReservationService(ReservationRepository reservationRepository) {
		this.reservationRepository = reservationRepository;
	}

	// Create Reservation
	public Reservation createReservation(Reservation reservation) {
		return reservationRepository.save(reservation);
	}

	// returns all the Reservations

	public List<Reservation> allReservation() {
		return reservationRepository.findAll();
	}

	// retrieves a Reservations
	public Reservation findReservation(Long id) {
		Optional<Reservation> optionalVenue = reservationRepository.findById(id);
		if (optionalVenue.isPresent()) {
			return optionalVenue.get();
		} else {
			return null;
		}
	}

	// edit a reservation
	public Reservation updatereservation(Long id, Date reservationDate, Time fromTime, Time toTime, String status,
			Date expirationDate, Venue venue, User user) {
		Reservation reservation = findReservation(id);
		reservation.setId(id);
		reservation.setReservationDate(reservationDate);
		reservation.setFromTime(fromTime);
		reservation.setToTime(toTime);
		reservation.setStatus(status);
		reservation.setExpirationDate(expirationDate);
		reservation.setVenue(venue);
		reservation.setUser(user);

		return reservationRepository.save(reservation);
	}

	public Reservation updatereservation2(Long id, UserSongs userSongs) {
		Reservation reservation = findReservation(id);
		reservation.setUserSongs(userSongs);
		return reservationRepository.save(reservation);
	}

	public Reservation updateReservationStatus(Long id, String status) {
		Reservation reservation = findReservation(id);
		double retainerPrice = reservation.getVenue().getPrice() * 0.33;
		System.out.println( reservation.getVenue().getPrice());
		System.out.println(retainerPrice);
		reservation.setStatus(status);
		reservation.setRetainer(retainerPrice);
		return reservationRepository.save(reservation);
	}

	// return reservations for specific user
	public List<Reservation> getUserReservation(Long id) {
		return reservationRepository.getUserReservation(id);
	}

	// updating the reservation
	public Reservation update(Reservation reservation) {
		return reservationRepository.save(reservation);
	}
	
    // delete the reservation
    public void deleteReservation(Long id) {
    	reservationRepository.deleteById(id);
    }

}
