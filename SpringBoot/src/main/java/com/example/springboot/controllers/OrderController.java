package com.example.springboot.controllers;
import com.example.springboot.entities.CreateOrderRequest;
import com.example.springboot.entities.Order;
import com.example.springboot.entities.OrderItem;
import com.example.springboot.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@RestController
@RequestMapping("/api/orders")
@CrossOrigin(origins = "http://localhost:4200")
    public class OrderController {
        private final OrderService orderService;
        @PostMapping("/addItems")
        public Order addItemsToOrder(@RequestBody CreateOrderRequest createOrderRequest) {
        List<OrderItem> orderItems = createOrderRequest.getItems();
        return orderService.addItemsToOrder(createOrderRequest.getCustomerId(), orderItems);
        }
        @Autowired
        public OrderController(OrderService orderService) {
            this.orderService = orderService;
        }

        @GetMapping
        public List<Order> getAllOrders() {
            return orderService.getAllOrders();
        }

        @GetMapping("/{id}")
        public ResponseEntity<Order> getOrderById(@PathVariable Long id) {
            Order order = orderService.getOrderById(id);
            return order != null ? ResponseEntity.ok(order) : ResponseEntity.notFound().build();
        }

        @PostMapping
        public Order createOrder(@RequestBody Order order) {
            return orderService.createOrder(order);
        }
    @PostMapping("/submit")
    public ResponseEntity<Order> submitOrder(@RequestBody Order order) {
        Order savedOrder = orderService.saveOrder(order);
        return ResponseEntity.ok(savedOrder);
    }
        @PutMapping("/{id}")
        public ResponseEntity<Order> updateOrder(@PathVariable Long id, @RequestBody Order order) {
            Order updatedOrder = orderService.updateOrder(id, order);
            return updatedOrder != null ? ResponseEntity.ok(updatedOrder) : ResponseEntity.notFound().build();
        }

        @DeleteMapping("/{id}")
        public ResponseEntity<Void> deleteOrder(@PathVariable Long id) {
            orderService.deleteOrder(id);
            return ResponseEntity.noContent().build();
        }
    @PostMapping("/create")
    public Order createOrder(@RequestBody CreateOrderRequest createOrderRequest) {
        List<OrderItem> orderItems = createOrderRequest.getItems();
        return orderService.createOrder(createOrderRequest.getCustomerId(), orderItems);
    }
    }

