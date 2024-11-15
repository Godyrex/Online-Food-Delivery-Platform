import { Component } from '@angular/core';
import {Order, OrderItem, OrderService} from "../../../shared/services/order.service";
import {Product, ProductService} from "../../../shared/services/product.service";

@Component({
  selector: 'app-order-list',
  templateUrl: './order-list.component.html',
  styleUrls: ['./order-list.component.scss']
})
export class OrderListComponent {
  orders: Order[] = [];
  products: Product[] = [];
  selectedProductId: number | null = null;
  quantity: number = 1;
  price: number = 0;
  newOrderItems: OrderItem[] = [];
  customerId: number = 1;
  creatingNewOrder: boolean = false;

  constructor(private orderService: OrderService, private productService: ProductService) {}

  ngOnInit(): void {
    this.loadOrders();
    this.loadProducts();
  }

  loadOrders() {
    this.orderService.getOrders().subscribe((orders) => {
      this.orders = orders;
    });
  }

  loadProducts() {
    this.productService.getProducts().subscribe((products) => {
      this.products = products;
    });
  }

  onProductSelect(productId: number) {
    console.log("Product selected:", productId);
    const selectedProduct = this.products.find(product => product.id === productId);
    if (selectedProduct) {
      this.price = selectedProduct.price;
    }
  }
  resetItemSelection() {
    this.selectedProductId = null;
    this.quantity = 1;
    this.price = 0;
  }
  addOrderItem(selectedProductId: number, quantity: number, price: number) {
    if (selectedProductId && quantity > 0) {
      const orderItem: OrderItem = {
        productId: selectedProductId,
        quantity: quantity,
        price: price * quantity, // Calculate total price for the item
      };
      this.newOrderItems.push(orderItem);
    } else {
      alert('Please select a product and quantity.');
    }
  }

  createNewOrder() {
    if (this.newOrderItems.length === 0) {
      alert('Please add at least one item to create an order.');
      return;
    }

    this.orderService.createOrder2(this.customerId, this.newOrderItems).subscribe(
        (response) => {
          alert('Order created successfully!');
          this.newOrderItems = []; // Clear items after order creation
          this.loadOrders(); // Refresh the order list
        },
        (error) => {
          alert('Failed to create order.');
          console.error(error);
        }
    );
  }


}
