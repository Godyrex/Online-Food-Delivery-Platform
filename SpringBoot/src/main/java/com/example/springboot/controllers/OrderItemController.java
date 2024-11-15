package com.example.springboot.controllers;


import com.example.springboot.entities.Order;
import com.example.springboot.entities.OrderItem;
import com.example.springboot.entities.OrderItemDTO;
import com.example.springboot.entities.Product;
import com.example.springboot.repositories.OrderItemRepository;
import com.example.springboot.repositories.OrderRepository;
import com.example.springboot.repositories.ProductRepository;
import com.example.springboot.services.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/order-items")
@CrossOrigin(origins = "http://localhost:4200")
public class OrderItemController {
    private final OrderItemService orderItemService;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;
    private final OrderItemRepository orderItemRepository;

    @Autowired
    public OrderItemController(OrderItemService orderItemService, OrderRepository orderRepository, ProductRepository productRepository, OrderItemRepository orderItemRepository) {
        this.orderItemService = orderItemService;
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
        this.orderItemRepository = orderItemRepository;
    }

    @GetMapping
    public List<OrderItem> getAllOrderItems() {
        return orderItemService.getAllOrderItems();
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderItem> getOrderItemById(@PathVariable Long id) {
        OrderItem orderItem = orderItemService.getOrderItemById(id);
        return orderItem != null ? ResponseEntity.ok(orderItem) : ResponseEntity.notFound().build();
    }

    @PostMapping("/{orderId}/add-item")
    public ResponseEntity<Order> createOrderItem(
            @PathVariable Long orderId,
            @RequestBody OrderItemDTO orderItemDTO
    ) {
        Order order = orderRepository.findById(orderId).orElse(new Order());
        Product product = productRepository.findById(orderItemDTO.getProductId())
                .orElseThrow(() -> new RuntimeException("Product not found"));
        OrderItem orderItem = new OrderItem();
        orderItem.setOrder(order);
        orderItem.setProduct(product);
        orderItem.setQuantity(orderItemDTO.getQuantity());
        orderItem.setPrice(orderItemDTO.getPrice());
        order.getItems().add(orderItem);
        orderRepository.save(order);
        return ResponseEntity.status(HttpStatus.CREATED).body(order);
    }


    @PutMapping("/{id}")
    public ResponseEntity<OrderItem> updateOrderItem(@PathVariable Long id, @RequestBody OrderItem orderItem) {
        OrderItem updatedOrderItem = orderItemService.updateOrderItem(id, orderItem);
        return updatedOrderItem != null ? ResponseEntity.ok(updatedOrderItem) : ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrderItem(@PathVariable Long id) {
        orderItemService.deleteOrderItem(id);
        return ResponseEntity.noContent().build();
    }
}
