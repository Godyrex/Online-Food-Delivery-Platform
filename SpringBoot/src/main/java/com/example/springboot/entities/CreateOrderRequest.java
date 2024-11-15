package com.example.springboot.entities;

import lombok.Data;
import lombok.Getter;

import java.util.List;

@Data
public class CreateOrderRequest {
    private Long customerId;
    private List<OrderItem> items;

}

