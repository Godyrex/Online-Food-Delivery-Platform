package com.example.reclamation.controller;

import com.example.reclamation.entity.Reclamation;
import com.example.reclamation.repository.ReclamationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/reclamations")
public class ReclamationController {

    private final ReclamationRepository reclamationRepository;

    @Autowired
    public ReclamationController(ReclamationRepository reclamationRepository) {
        this.reclamationRepository = reclamationRepository;
    }

    @PostMapping("/add")
    public ResponseEntity<Reclamation> addReclamation(@RequestBody Reclamation reclamation) {
        try {
            Reclamation savedReclamation = reclamationRepository.save(reclamation);
            return new ResponseEntity<>(savedReclamation, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);  // Return 400 for errors
        }
    }

    @GetMapping("/get")
    public ResponseEntity<List<Reclamation>> getReclamations() {
        try {
            // Fetching all reclamations from the repository
            List<Reclamation> savedReclamation = reclamationRepository.findAll();

            // Return the list of reclamations with a 200 OK status
            return new ResponseEntity<>(savedReclamation, HttpStatus.OK);
        } catch (Exception e) {
            // If there's an error, return a 400 Bad Request status
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }


}
