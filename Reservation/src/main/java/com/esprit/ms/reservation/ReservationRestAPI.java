package com.esprit.ms.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;
@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/reservations")
public class ReservationRestAPI {
    private final ReservationService reservationService;

    @Autowired
    public ReservationRestAPI(ReservationService reservationService) {
        this.reservationService = reservationService;
    }

    // Get all reservations
    @GetMapping
    public ResponseEntity<List<Reservation>> getAllReservations() {
        List<Reservation> reservations = reservationService.retrieveAllReservations();
        return new ResponseEntity<>(reservations, HttpStatus.OK);
    }

    // Get a reservation by ID
    @GetMapping("/{id}")
    public ResponseEntity<Reservation> getReservationById(@PathVariable Long id) {
        try {
            Reservation reservation = reservationService.retrieveReservation(id);
            return new ResponseEntity<>(reservation, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Create a new reservation
    @PostMapping("/add-reservation")
    public ResponseEntity<Reservation> createReservation(@RequestBody Reservation reservation) {
        // Appel du service pour ajouter la réservation
        Reservation savedReservation = reservationService.addReservation(reservation);
        return new ResponseEntity<>(savedReservation, HttpStatus.CREATED);  // Retour de la réponse avec le statut 201
    }

    // Update an existing reservation
    @PutMapping("/{id}")
    public ResponseEntity<Reservation> updateReservation(@PathVariable Long id, @RequestBody Reservation reservation) {
        try {
            reservation.setId(id);  // Set the ID to the path variable to ensure correct modification
            Reservation updatedReservation = reservationService.modifyReservation(reservation);
            return new ResponseEntity<>(updatedReservation, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Delete a reservation by ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteReservation(@PathVariable Long id) {
        try {
            reservationService.removeReservation(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
