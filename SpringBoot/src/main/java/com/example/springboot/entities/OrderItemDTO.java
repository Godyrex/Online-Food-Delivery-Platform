package com.example.springboot.entities;

import jakarta.persistence.Entity;
import lombok.Data;

@Data
public class OrderItemDTO {
    private Long id;
    private Long orderId;
    private Long productId;
    private int quantity;
    private double price;
}
