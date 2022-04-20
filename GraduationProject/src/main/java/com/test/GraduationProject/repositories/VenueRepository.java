package com.test.GraduationProject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.test.GraduationProject.models.Venue;

@Repository
public interface VenueRepository extends CrudRepository<Venue, Long> {

	List<Venue>findAll();
	Optional<Venue> findById(Long id);
	void delete(Venue venue);
	
    //@Query("SELECT venue FROM venues venue WHERE venue.price = :#{#price} or venue.location = :#{#location}")
	@Query(value="SELECT * FROM venues where price= :price or location= :location or num_of_guests= :numOfGuests", nativeQuery=true)
	List<Venue>filterSearch(@Param("price") float price,@Param("location") String location,@Param("numOfGuests") int numOfGuests);
	
//	@Query("numOfGuests venue FROM venues venue WHERE venue.price = :#{#price} or venue.location= :#{#location} or venue.numOfGuests= :#{#numOfGuests} ")
//	List<Venue> filterSearch(@Param("price") float price,@Param("location") String location,@Param("numOfGuests") int numOfGuests );
}
