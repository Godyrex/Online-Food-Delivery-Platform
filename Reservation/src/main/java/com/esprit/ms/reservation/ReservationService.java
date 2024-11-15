package com.esprit.ms.reservation;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.NoSuchElementException;
import java.util.Date;
import java.util.List;
import org.springframework.web.server.ResponseStatusException;
@Service
@Transactional
public class ReservationService {
    private final ReservationRepository reservationRepository;

    @Autowired
    public ReservationService(ReservationRepository reservationRepository) {
        this.reservationRepository = reservationRepository;
    }

    public List<Reservation> retrieveAllReservations() {
        return reservationRepository.findAll();
    }

    public Reservation retrieveReservation(Long reservationId) {
        return reservationRepository.findById(reservationId)
                .orElseThrow(() ->  new NoSuchElementException("Reservation not found"));
    }

    public Reservation addReservation(Reservation reservation) {
        // Validation des champs obligatoires
        if (reservation.getCustomerName() == null || reservation.getCustomerName().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Customer name is required.");
        }
        if (reservation.getPhoneNumber() == null || reservation.getPhoneNumber().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Phone number is required.");
        }
        if (reservation.getReservationDate() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Reservation date is required.");
        }
        if (reservation.getReservationDate().isBefore(LocalDateTime.now())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Reservation date cannot be in the past.");
        }
        // Si le statut n'est pas spécifié, on le met à PENDING par défaut
        if (reservation.getStatus() == null) {
            reservation.setStatus(Reservation.ReservationStatus.PENDING);
        }

        // Enregistrement de la réservation dans la base de données
        return reservationRepository.save(reservation);
    }



    public Reservation modifyReservation(Reservation reservation) {
        if (!reservationRepository.existsById(reservation.getId())) {
            throw new NoSuchElementException("Reservation not found");
        }
        return reservationRepository.save(reservation);
    }

    public void removeReservation(Long reservationId) {
        if (reservationRepository.existsById(reservationId)) {
            reservationRepository.deleteById(reservationId);
        } else {
            throw new NoSuchElementException("Reservation not found");
        }
    }
}
