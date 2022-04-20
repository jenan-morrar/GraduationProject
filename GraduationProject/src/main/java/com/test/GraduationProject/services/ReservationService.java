package com.test.GraduationProject.services;

import java.util.Date;
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
	public Reservation updatereservation(Long id, Date fromDate, Date toDate, Venue venue, User user) {
		Reservation reservation = findReservation(id);
		reservation.setId(id);
		reservation.setToDate(toDate);
		reservation.setFromDate(fromDate);
		reservation.setUser(user);
		reservation.setVenue(venue);

		return reservationRepository.save(reservation);
	}

}
