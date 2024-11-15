package com.example.springboot.services;

import com.example.springboot.entities.Order;
import com.example.springboot.entities.OrderItem;
import com.example.springboot.repositories.OrderItemRepository;
import com.example.springboot.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;

    @Autowired
    public OrderService(OrderRepository orderRepository, OrderItemRepository orderItemRepository) {
        this.orderRepository = orderRepository;
        this.orderItemRepository = orderItemRepository;
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public Order getOrderById(Long id) {
        return orderRepository.findById(id).orElse(null);
    }

    public Order createOrder(Order order) {
        return orderRepository.save(order);
    }

    public Order updateOrder(Long id, Order order) {
        if (orderRepository.existsById(id)) {
            order.setId(id);
            return orderRepository.save(order);
        }
        return null;
    }
    public Order saveOrder(Order order) {
        // Here, you can handle additional business logic if necessary
        return orderRepository.save(order);
    }
    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);
    }
    public Order createOrder(Long customerId, List<OrderItem> orderItems) {
        Order order = new Order();
        order.setCustomerId(customerId);
        order.setOrderDate(LocalDateTime.now());
        order.setStatus("pending");
        order.setItems(orderItems);
        order = orderRepository.save(order);
        for (OrderItem item : orderItems) {
            item.setOrder(order);
            orderItemRepository.save(item);
        }

        return order;
    }
    public Order addItemsToOrder(Long customerId, List<OrderItem> orderItems) {
        // Create the order object, but don't save it yet
        Order order = new Order();
        order.setCustomerId(customerId);
        order.setOrderDate(LocalDateTime.now());
        order.setStatus("pending"); // Default status for new orders

        // Add items to the order
        order.setItems(orderItems);

        // Set the order for each order item
        for (OrderItem item : orderItems) {
            item.setOrder(order);
        }

        // Save the order and its items to the database
        order = orderRepository.save(order);

        // Now save the order items
        orderItemRepository.saveAll(orderItems);

        return order;
    }
}
