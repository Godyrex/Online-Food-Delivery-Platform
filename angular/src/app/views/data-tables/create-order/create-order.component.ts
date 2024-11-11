import { Component } from '@angular/core';
import {Product, ProductService} from "../../../shared/services/product.service";
import {Order, OrderItem, OrderService} from "../../../shared/services/order.service";

@Component({
  selector: 'app-create-order',
  templateUrl: './create-order.component.html',
  styleUrls: ['./create-order.component.scss']
})
export class CreateOrderComponent {

  products: Product[] = [];      // List of products available
  selectedProduct!: Product;     // Currently selected product
  quantity: number = 1;          // Quantity for the selected product

  order: Order = {               // Initialize an empty order
    id: 0,
    customerId: 1,               // Assuming a fixed customer ID for simplicity
    orderDate: new Date(),
    status: 'PENDING',
    items: []                    // List to hold order items
  };

  constructor(
      private productService: ProductService,  // Service to fetch products
      private orderService: OrderService       // Service to manage order actions
  ) {}

  ngOnInit(): void {
    this.fetchProducts();        // Fetch available products to add to the order
  }

  // Fetch available products from the backend
  fetchProducts(): void {
    this.productService.getProducts().subscribe(
        (products: Product[]) => {
          this.products = products;    // Populate products list
        },
        error => {
          console.error('Error fetching products:', error);
        }
    );
  }

  // Method to add a product with a specified quantity to the order
  addToOrder(product: Product, quantity: number): void {
    if (quantity <= 0) {
      alert('Quantity must be greater than zero.');
      return;
    }

    // Create a new order item for the selected product
    const orderItem: OrderItem = {
      id: 0,                      // Backend will assign the ID
      productId: product.id,
      quantity: quantity,
      price: product.price
    };

    // Add the new order item to the order's items array
    this.order.items.push(orderItem);
    console.log('Added item to order:', orderItem);
  }

  // Submit the order to the backend
  submitOrder(): void {
    this.orderService.createOrder(this.order).subscribe(
        response => {
          console.log('Order submitted successfully:', response);
          alert('Order submitted successfully!');

          // Reset the order after submission
          this.order = {
            id: 0,
            customerId: 1,
            orderDate: new Date(),
            status: 'PENDING',
            items: []
          };
        },
        error => {
          console.error('Error submitting order:', error);
          alert('Error submitting order');
        }
    );
  }
}
