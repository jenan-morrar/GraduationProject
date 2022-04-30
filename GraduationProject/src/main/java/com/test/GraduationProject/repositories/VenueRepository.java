package com.test.GraduationProject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.test.GraduationProject.models.Reservation;
import com.test.GraduationProject.models.Venue;

@Repository
public interface VenueRepository extends CrudRepository<Venue, Long> {

	List<Venue> findAll();

	Optional<Venue> findById(Long id);

	void delete(Venue venue);

	// Search in Venue Name
	@Query(value = "SELECT * FROM venues where name LIKE %:name% ", nativeQuery = true)
	List<Venue> search(@Param("name") String name);

	
	// @Query("SELECT venue FROM venues venue WHERE venue.price = :#{#price} or
	// venue.location = :#{#location}")
	@Query(value = "SELECT * FROM venues where (price>= :minPrice and price<= :maxPrice) or location= :location or (num_of_guests>= :minNumOfGuests and num_of_guests<= :maxNumOfGuests)", nativeQuery = true)
	List<Venue> filterSearch(@Param("location") String location, @Param("minPrice") float minPrice,
			@Param("maxPrice") float maxPrice, @Param("minNumOfGuests") int minNumOfGuests,
			@Param("maxNumOfGuests") int maxNumOfGuests);

	//@Query(value="SELECT venue, COUNT(res.id) FROM Reservation res JOIN res.venue venue WHERE res.status= :status GROUP BY res.id")
	@Query(value="SELECT *, COUNT(reservations.venue_id) FROM venues INNER JOIN reservations ON venues.id=reservations.venue_id GROUP BY reservations.venue_id LIMIT 3", nativeQuery = true)
	List<Venue> mostReservedVenues(@Param("status") String status);

//	@Query("numOfGuests venue FROM venues venue WHERE venue.price = :#{#price} or venue.location= :#{#location} or venue.numOfGuests= :#{#numOfGuests} ")
//	List<Venue> filterSearch(@Param("price") float price,@Param("location") String location,@Param("numOfGuests") int numOfGuests );
}
