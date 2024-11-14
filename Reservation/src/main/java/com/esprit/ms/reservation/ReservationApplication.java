package com.esprit.ms.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import java.time.LocalDateTime;

@SpringBootApplication
public class ReservationApplication {

	public static void main(String[] args) {
		SpringApplication.run(ReservationApplication.class, args);
	}
@Autowired
	private ReservationRepository reservationRepository;
	@Autowired
	private ReservationRepository   repository;
	@Bean
	ApplicationRunner init(){
		return args -> {
			repository.save(new Reservation("Amira", "123456789",
					LocalDateTime.now(),
					Reservation.ReservationStatus.PENDING));
			repository.save(new Reservation("John Doe", "987654321",
					LocalDateTime.now().plusDays(1),
					Reservation.ReservationStatus.CONFIRMED));
			repository.findAll().forEach(System.out::println);
		};
}}









