package com.esprit.microservice.menu.repository;

import com.esprit.microservice.menu.entity.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MenuRepository extends JpaRepository<Menu, Integer> {
}
