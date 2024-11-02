package com.esprit.microservice.menu.repository;

import com.esprit.microservice.menu.entity.MenuItem;
import org.springframework.data.jpa.repository.JpaRepository;



public interface MenuItemRepository extends JpaRepository<MenuItem, Integer> {
}
