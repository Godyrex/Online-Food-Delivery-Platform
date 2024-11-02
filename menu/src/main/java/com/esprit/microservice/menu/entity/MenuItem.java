package com.esprit.microservice.menu.entity;

import jakarta.persistence.*;


@Entity
public class MenuItem {
    private static final long serialVersionUID = 6;

    @Id
    @GeneratedValue
    private int itemId;
    private String name;
    private String description;
    private double price;
    private boolean isAvailable;
    @ManyToOne
    @JoinColumn(name = "menu_id")
    private Menu menu;


    // No-arg constructor for JPA
    public MenuItem() {}

    // Constructor without itemId and isAvailable fields
    public MenuItem(String name, double price, String description) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.isAvailable = true; // Default to available if not provided
    }

    // Getters and setters
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }
}

