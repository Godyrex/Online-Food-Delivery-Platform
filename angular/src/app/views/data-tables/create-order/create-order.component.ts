import { Component } from '@angular/core';
import {Product, ProductService} from "../../../shared/services/product.service";
import {Order, OrderItem, OrderService} from "../../../shared/services/order.service";

@Component({
  selector: 'app-create-order',
  templateUrl: './create-order.component.html',
  styleUrls: ['./create-order.component.scss']
})


export class CreateOrderComponent {
  orderId: number; // Order ID for the selected Order
  orderItems: OrderItemDTO[] = []; // Array to hold multiple items for the order
  products: Product[] = []; // Array of available products
  orders: Order[] = []; // Array of available orders
  selectedProductId: number; // ID of the selected product
  selectedOrderId: number; // ID of the selected order
  orderItemQuantity: number = 1; // Quantity for the selected order item
  orderItemPrice: number = 0; // Price for the selected order item

  constructor(
      private orderService: OrderService,
      private productService: ProductService
  ) {}

  ngOnInit(): void {
    // Fetch products and orders for the dropdowns
    this.productService.getProducts().subscribe((products) => {
      this.products = products;
    });
    this.orderService.getOrders().subscribe((orders) => {
      this.orders = orders;
    });
  }

  addOrderItem() {
    const selectedProduct = this.products.find(product => product.id === this.selectedProductId);
    const selectedOrder = this.orders.find(order => order.id === this.selectedOrderId);
    if (selectedProduct && selectedOrder) {
      const newItem: OrderItemDTO = {
        orderId: this.selectedOrderId,
        productId: this.selectedProductId,
        productName: selectedProduct.name,
        quantity: this.orderItemQuantity,
        price: this.orderItemPrice
      };
      this.orderItems.push(newItem);
    }
  }

  removeOrderItem(item: OrderItemDTO): void {
    const index = this.orderItems.indexOf(item);
    if (index > -1) {
      this.orderItems.splice(index, 1);
    }
  }

  createOrderWithItems() {
    // Call backend to create or update the order with all items
    this.orderService.createOrderWithItems(this.orderId, this.orderItems).subscribe(
        (order) => {
          console.log('Order created with items:', order);
          alert('Order created successfully!');
        },
        (error) => {
          console.error('Error creating order with items:', error);
          alert('Error creating order.');
        }
    );
  }
}

// DTO for Order Items, with added fields for product and order names
export class OrderItemDTO {
  id?: number;
  orderId: number;
  productId: number;
  productName: string;
  quantity: number;
  price: number;

  constructor(orderId: number, productId: number, productName: string, quantity: number, price: number) {
    this.id = undefined;
    this.orderId = orderId;
    this.productId = productId;
    this.productName = productName;
    this.quantity = quantity;
    this.price = price;
  }
}
