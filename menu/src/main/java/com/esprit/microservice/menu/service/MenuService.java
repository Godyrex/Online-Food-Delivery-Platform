package com.esprit.microservice.menu.service;

import com.esprit.microservice.menu.entity.Menu;
import com.esprit.microservice.menu.entity.MenuItem;
import com.esprit.microservice.menu.repository.MenuRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MenuService {

    @Autowired
    private MenuRepository menuRepository;

    // Get all menus
    public List<Menu> getAllMenus() {
        return menuRepository.findAll();
    }

    // Get menu by ID
    public Optional<Menu> getMenuById(int menuId) {
        return menuRepository.findById(menuId);
    }

    // Add a new menu
    public Menu addMenu(Menu menu) {
        return menuRepository.save(menu);
    }

    // Update an existing menu
    @Transactional
    public Menu updateMenu(int menuId, Menu menuDetails) {
        return menuRepository.findById(menuId).map(menu -> {
            menu.setRestaurantName(menuDetails.getRestaurantName());
            menu.setCuisineType(menuDetails.getCuisineType());
            menu.setDescription(menuDetails.getDescription());
            menu.setMenuType(menuDetails.getMenuType());
            menu.setContactNumber(menuDetails.getContactNumber());
            menu.setAveragePreparationTime(menuDetails.getAveragePreparationTime());
            return menuRepository.save(menu);
        }).orElseThrow(() -> new RuntimeException("Menu not found with id " + menuId));
    }

    // Delete a menu by ID
    public void deleteMenu(int menuId) {
        menuRepository.deleteById(menuId);
    }

    // Add a menu item to a menu
    @Transactional
    public Menu addMenuItemToMenu(int menuId, MenuItem menuItem) {
        return menuRepository.findById(menuId).map(menu -> {
            menu.addItem(menuItem);
            return menuRepository.save(menu);
        }).orElseThrow(() -> new RuntimeException("Menu not found with id " + menuId));
    }
}
