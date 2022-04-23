package com.test.GraduationProject.services;

import java.sql.Time;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.test.GraduationProject.models.Reservation;
import com.test.GraduationProject.models.User;
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

	// edit a reservatio
	public Reservation updatereservation(Long id, Date reservationDate, Time fromTime, Time toTime,Venue venue, User user) {
		Reservation reservation = findReservation(id);
		reservation.setId(id);
		reservation.setReservationDate(reservationDate);
		reservation.setFromTime(fromTime);
		reservation.setFromTime(toTime);
		reservation.setVenue(venue);
		reservation.setUser(user);

		return reservationRepository.save(reservation);
	}

}
