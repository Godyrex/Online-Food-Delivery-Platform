import { Component } from '@angular/core';
import {Product, ProductService} from "../../../shared/services/product.service";
import {Order, OrderItem, OrderService} from "../../../shared/services/order.service";

@Component({
  selector: 'app-create-order',
  templateUrl: './create-order.component.html',
  styleUrls: ['./create-order.component.scss']
})


export class CreateOrderComponent {
  orders: Order[] = [];
  products: Product[] = [];
  orderItems: OrderItem[] = []; // This will hold the order items to display
  selectedOrderId: number;
  selectedProductId: number;
  quantity: number = 1;
  price: number = 0;
  selectedProductPrice: number = 0;

  constructor(
      private orderService: OrderService,
      private productService: ProductService
  ) {}

  ngOnInit(): void {
    // Fetch orders and products from the service
    this.orderService.getOrders().subscribe((orders) => {
      this.orders = orders;
    });

    this.productService.getProducts().subscribe((products) => {
      this.products = products;
    });
  }

  onProductSelect(): void {
    const selectedProduct = this.products.find(
        (product) => product.id === this.selectedProductId
    );
    if (selectedProduct) {
      this.selectedProductPrice = selectedProduct.price;
    }
  }

  createOrderItem(): void {
    const orderItem: OrderItem = {
      orderId: this.selectedOrderId,
      productId: this.selectedProductId,
      quantity: this.quantity,
      price: this.selectedProductPrice
    };

    this.orderService.createOrderItem(orderItem).subscribe(
        (response) => {
          console.log('Order item created:', response);
          alert('Order item created successfully!');
          this.orderItems.push(response); // Push the created order item to the list
        },
        (error) => {
          console.error('Error creating order item:', error);
          alert('Error creating order item.');
        }
    );
  }




}

export class OrderItemDTO {
  id?: number;
  orderId: number;
  productId: number;
  quantity: number;
  price: number;

  constructor(orderId: number, productId: number, quantity: number, price: number) {
    this.id = undefined;
    this.orderId = orderId;
    this.productId = productId;
    this.quantity = quantity;
    this.price = price;
  }}
