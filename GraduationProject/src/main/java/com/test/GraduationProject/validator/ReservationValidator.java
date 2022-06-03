package com.test.GraduationProject.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.test.GraduationProject.models.Reservation;

@Component
public class ReservationValidator implements Validator {

    //    1
    @Override
    public boolean supports(Class<?> clazz) {
        return Reservation.class.equals(clazz);
    }
    
    // 2
    @Override
    public void validate(Object object, Errors errors) {
        Reservation reservation = (Reservation)object;

		reservation.setFromTime(java.sql.Time.valueOf(reservation.getStartTime() + ":00"));
		reservation.setToTime(java.sql.Time.valueOf(reservation.getEndTime() + ":00"));
		
        if(reservation.getToTime().before(reservation.getFromTime())) {
        	errors.rejectValue("toTime", "TimeError");
        }
    }
}
