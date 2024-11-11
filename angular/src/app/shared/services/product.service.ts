import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable} from "rxjs";
import {OrderItem} from "./order.service";
export interface Product {
  id: number;
  name: string;
  description: string;
  price: number;
  category: string;
  orderItems:OrderItem[];
}
@Injectable({
  providedIn: 'root'
})

export class ProductService {
  private baseUrl = 'http://localhost:8081/customerOrder/api/products';

  constructor(
    private http: HttpClient
  ) { }

  getProducts(): Observable<Product[]> {
    return this.http.get<Product[]>(this.baseUrl);
  }
  getProductById(id: number): Observable<Product> {
    return this.http.get<Product>(`${this.baseUrl}/${id}`);
  }
  createProduct(product: any): Observable<any> {
    return this.http.post<any>(this.baseUrl, product);
  }
  updateProduct(id: number, product: Product): Observable<Product> {
    return this.http.put<Product>(`${this.baseUrl}/${id}`, product, {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' })
    });
  }
  deleteProduct(id: number): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${id}`);
  }

}
