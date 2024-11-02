package com.esprit.microservice.menu.service;

import com.esprit.microservice.menu.entity.MenuItem;
import com.esprit.microservice.menu.repository.MenuItemRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MenuItemService {

    @Autowired
    private MenuItemRepository menuItemRepository;

    // Get all menu items
    public List<MenuItem> getAllMenuItems() {
        return menuItemRepository.findAll();
    }

    // Get menu item by ID
    public Optional<MenuItem> getMenuItemById(int itemId) {
        return menuItemRepository.findById(itemId);
    }

    // Add a new menu item
    public MenuItem addMenuItem(MenuItem menuItem) {
        return menuItemRepository.save(menuItem);
    }

    // Update an existing menu item
    @Transactional
    public MenuItem updateMenuItem(int itemId, MenuItem menuItemDetails) {
        return menuItemRepository.findById(itemId).map(menuItem -> {
            menuItem.setName(menuItemDetails.getName());
            menuItem.setDescription(menuItemDetails.getDescription());
            menuItem.setPrice(menuItemDetails.getPrice());
            menuItem.setAvailable(menuItemDetails.isAvailable());
            return menuItemRepository.save(menuItem);
        }).orElseThrow(() -> new RuntimeException("MenuItem not found with id " + itemId));
    }

    // Delete a menu item by ID
    public void deleteMenuItem(int itemId) {
        menuItemRepository.deleteById(itemId);
    }
}
