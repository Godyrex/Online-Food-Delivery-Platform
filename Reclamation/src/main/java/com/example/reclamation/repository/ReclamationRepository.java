package com.example.reclamation.repository;

import com.example.reclamation.entity.Reclamation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReclamationRepository extends JpaRepository<Reclamation, Long> {
    // You can define custom queries if needed, e.g., find by status
}
