package com.esprit.microservice.menu.controller;

import com.esprit.microservice.menu.entity.MenuItem;
import com.esprit.microservice.menu.service.MenuItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/menu-items")
public class MenuItemRestAPI {

    @Autowired
    private MenuItemService menuItemService;

    // Get all menu items
    @GetMapping
    public List<MenuItem> getAllMenuItems() {
        return menuItemService.getAllMenuItems();
    }

    // Get a menu item by ID
    @GetMapping("/{itemId}")
    public ResponseEntity<MenuItem> getMenuItemById(@PathVariable int itemId) {
        Optional<MenuItem> menuItem = menuItemService.getMenuItemById(itemId);
        return menuItem.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Create a new menu item
    @PostMapping
    public MenuItem createMenuItem(@RequestBody MenuItem menuItem) {
        return menuItemService.addMenuItem(menuItem);
    }

    // Update a menu item by ID
    @PutMapping("/{itemId}")
    public ResponseEntity<MenuItem> updateMenuItem(@PathVariable int itemId, @RequestBody MenuItem menuItemDetails) {
        try {
            MenuItem updatedMenuItem = menuItemService.updateMenuItem(itemId, menuItemDetails);
            return ResponseEntity.ok(updatedMenuItem);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    // Delete a menu item by ID
    @DeleteMapping("/{itemId}")
    public ResponseEntity<Void> deleteMenuItem(@PathVariable int itemId) {
        menuItemService.deleteMenuItem(itemId);
        return ResponseEntity.noContent().build();
    }
}
