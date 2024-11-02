package com.esprit.microservice.menu.controller;

import com.esprit.microservice.menu.entity.Menu;
import com.esprit.microservice.menu.entity.MenuItem;
import com.esprit.microservice.menu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/menus")
public class MenuRestAPI {

    @Autowired
    private MenuService menuService;

    // Get all menus
    @GetMapping
    public List<Menu> getAllMenus() {
        return menuService.getAllMenus();
    }

    // Get a menu by ID
    @GetMapping("/{menuId}")
    public ResponseEntity<Menu> getMenuById(@PathVariable int menuId) {
        Optional<Menu> menu = menuService.getMenuById(menuId);
        return menu.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Create a new menu
    @PostMapping
    public Menu createMenu(@RequestBody Menu menu) {
        return menuService.addMenu(menu);
    }

    // Update a menu by ID
    @PutMapping("/{menuId}")
    public ResponseEntity<Menu> updateMenu(@PathVariable int menuId, @RequestBody Menu menuDetails) {
        try {
            Menu updatedMenu = menuService.updateMenu(menuId, menuDetails);
            return ResponseEntity.ok(updatedMenu);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    // Delete a menu by ID
    @DeleteMapping("/{menuId}")
    public ResponseEntity<Void> deleteMenu(@PathVariable int menuId) {
        menuService.deleteMenu(menuId);
        return ResponseEntity.noContent().build();
    }

    // Add a menu item to a menu
    @PostMapping("/{menuId}/items")
    public ResponseEntity<Menu> addMenuItemToMenu(@PathVariable int menuId, @RequestBody MenuItem menuItem) {
        try {
            Menu updatedMenu = menuService.addMenuItemToMenu(menuId, menuItem);
            return ResponseEntity.ok(updatedMenu);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
