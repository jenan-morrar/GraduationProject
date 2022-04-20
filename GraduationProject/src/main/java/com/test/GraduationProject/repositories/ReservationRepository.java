package com.test.GraduationProject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.test.GraduationProject.models.Reservation;

@Repository
public interface ReservationRepository extends CrudRepository<Reservation, Long> {

	List<Reservation>findAll();
	Optional<Reservation> findById(Long id);
	void delete(Reservation reservation);
}
