import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {Observable} from "rxjs";
import {OrderItemDTO} from "../../views/data-tables/create-order/create-order.component";

export interface Order {
  id?: number;
  customerId?: number;
  orderDate?: Date;
  status?: string;
  items?: OrderItem[];
}

// OrderItem model
export interface OrderItem {
  id?: number;
  productId?: number;
  orderId?: number;
  quantity?: number;
  price?: number;
}
@Injectable({
  providedIn: 'root'
})
export class
OrderService {

  private baseUrl = 'http://localhost:8081/customerOrder/api/orders';
  private orderItemsUrl = 'http://localhost:8081/customerOrder/api/order-items';

  constructor(private http: HttpClient) { }
  submitOrder(order: Order): Observable<Order> {
    return this.http.post<Order>(`${this.baseUrl}/submit`, order);
  }

  createOrder(order: Order): Observable<Order> {
    return this.http.post<Order>(this.baseUrl, order);
  }
  createOrder2(customerId: number, items: OrderItem[]): Observable<Order> {
    const orderData = {
      customerId,
      items,
    };
    return this.http.post<Order>(this.baseUrl, orderData);
  }
  getOrders(): Observable<Order[]> {
    return this.http.get<Order[]>(this.baseUrl);
  }
  createOrderItem(orderItemDTO: OrderItemDTO): Observable<any> {
    return this.http.post<any>(this.orderItemsUrl, orderItemDTO, {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    });
  }
  getOrder(): Observable<Order> {
    return this.http.get<Order>(this.baseUrl);
  }

  getOrderById(id: number): Observable<Order> {
    return this.http.get<Order>(`${this.baseUrl}/${id}`);
  }
  updateOrder(id: number, order: Order): Observable<Order> {
    return this.http.put<Order>(`${this.baseUrl}/${id}`, order, {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    });
  }
  deleteOrder(id: number): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${id}`);
  }
  createOrderWithItems(orderId: number, orderItems: OrderItemDTO[]): Observable<Order> {
    return this.http.post<Order>(`${this.baseUrl}/${orderId}/add-item`, orderItems);
  }
  createOrder1(customerId: number, items: OrderItem[]): Observable<Order> {
    const orderData = {
      customerId,
      items,
    };
    return this.http.post<Order>(this.baseUrl, orderData);
  }
}
