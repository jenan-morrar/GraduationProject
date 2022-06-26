package com.test.GraduationProject.services;

import java.sql.Time;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.test.GraduationProject.models.Reservation;
import com.test.GraduationProject.models.ServiceOfVenue;
import com.test.GraduationProject.models.User;
import com.test.GraduationProject.models.UserSongs;
import com.test.GraduationProject.models.Venue;
import com.test.GraduationProject.repositories.ReservationRepository;
import com.test.GraduationProject.repositories.UserRepository;

@Service
public class ReservationService {

	private ReservationRepository reservationRepository;
	private UserRepository userRepository;
	@Autowired
	private JavaMailSender emailSender;

	public ReservationService(ReservationRepository reservationRepository, UserRepository userRepository) {
		this.reservationRepository = reservationRepository;
		this.userRepository = userRepository;
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

	// return reservations for specific user
	public List<Reservation> getUserReservation(Long id) {
		return reservationRepository.getUserReservation(id);
	}

	// updating the reservation
	public Reservation update(Reservation reservation) {
		return reservationRepository.save(reservation);
	}

	// find user by email to send confirmation
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	// send code via email to confirm delete
	public void sendCode(User user , String code) throws MessagingException {
		User userByEmail = findByEmail(user.getEmail());
		if (userByEmail != null) {

			String from = "palvenues@outlook.com";
			String to = user.getEmail();

			MimeMessage message = emailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);

			helper.setSubject("تأكيد حذف الحجز");
			helper.setFrom(from);
			helper.setTo(to);
			//String code = getAlphaNumericString(6); 

			String content = "        <h1>\r\n" + "            PalVenues\r\n" + "        </h1>\r\n"
					+ "        <h1>مرحبا,</h1>\r\n" + "        <h3>\r\n"
					+ "            لقد وصلنا طلب لحذف حجز القاعة ,\n يرجى العلم انه بعد تأكيد الحذف لن يمكن استرجاعه , \n اذا كنت تريد التراجع يمكنك تجاهل هذه الرسالة ولن يتضرر حجزك , "
					+ "\n لاستكمال عملية الحذف يرجى إدخال الرمز في الخانة المحددة علماً انه لن يمكنك استرجاع الحجز بعد ذلك </h3>\r\n"
					+   "         <b>\r\n"+     code + "      </b> \r\n" ; 
			helper.setText(content, true);

			// FileSystemResource resource = new FileSystemResource(new
			// File("picture.png"));
		//	ClassPathResource resource = new ClassPathResource("/static/images/welcom.jpg");
	//		helper.addInline("welcomImage", resource);

			emailSender.send(message);

		//	userRepository.save(user);
			//return code;
		}
		//return false;
		//return "" ; 
	}
	  // function to generate a random string of length n
    public String getAlphaNumericString(int n)
    {
  
        // chose a Character random from this String
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz";
  
        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(n);
  
        for (int i = 0; i < n; i++) {
  
            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                = (int)(AlphaNumericString.length()
                        * Math.random());
  
            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                          .charAt(index));
        }
  
        return sb.toString();
    }
    // delete reservation by ID 
    public void deleteReservation(long id) {
    	reservationRepository.deleteById(id);
    }
    // edit reservation on edit page 
	public Reservation editReservation(Long id, Date reservationDate, Time fromTime, Time toTime, String status,
			Date expirationDate, Venue venue, User user, List<ServiceOfVenue> services) {
		Reservation reservation = findReservation(id);
		reservation.setId(id);
		reservation.setReservationDate(reservationDate);
		reservation.setFromTime(fromTime);
		reservation.setToTime(toTime);
		reservation.setStatus(status);
		reservation.setExpirationDate(expirationDate);
		reservation.setVenue(venue);
		reservation.setUser(user);
		reservation.setServices(services);

		return reservationRepository.save(reservation);
	}

}
