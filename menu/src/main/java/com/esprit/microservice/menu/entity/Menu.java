package com.esprit.microservice.menu.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.*;
import java.io.Serializable;


@Entity
public class Menu implements Serializable {
    private static final long serialVersionUID = 6;

    @Id
    @GeneratedValue
    private int menuId;

    private String restaurantName;

    private String cuisineType;         // Type of cuisine (e.g., Italian, Chinese)
    private String description;          // Description of the menu

    private String menuType;             // Type of menu (e.g., breakfast, lunch, dinner)

    private String contactNumber;        // Contact number for the restaurant
    private int averagePreparationTime;  // Average preparation time in minutes

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "menu_id")
    private List<MenuItem> items = new ArrayList<>();  // List of menu items

    // Constructors
    public Menu() {}

    public Menu(String restaurantName, String cuisineType, String description,
                String menuType, String contactNumber, int averagePreparationTime) {
        this.restaurantName = restaurantName;
        this.cuisineType = cuisineType;
        this.description = description;
        this.menuType = menuType;
        this.contactNumber = contactNumber;
        this.averagePreparationTime = averagePreparationTime;
    }

    // Getters and Setters
    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public String getMenuType() {
        return menuType;
    }

    public void setMenuType(String menuType) {
        this.menuType = menuType;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }


    public int getAveragePreparationTime() {
        return averagePreparationTime;
    }

    public void setAveragePreparationTime(int averagePreparationTime) {
        this.averagePreparationTime = averagePreparationTime;
    }

    public List<MenuItem> getItems() {
        return items;
    }

    public void setItems(List<MenuItem> items) {
        this.items = items;
    }

    // Methods to add or remove items from the menu
    public void addItem(MenuItem item) {
        items.add(item);
    }

    public boolean removeItem(int itemId) {
        return items.removeIf(item -> item.getItemId() == itemId);
    }
}
