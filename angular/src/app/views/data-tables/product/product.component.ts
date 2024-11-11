import { Component } from '@angular/core';
import {Product, ProductService} from "../../../shared/services/product.service";
import {OrderItem} from "../../../shared/services/order.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss']
})
export class ProductComponent {
  products: Product[] = [];

  constructor(private productService: ProductService,private router: Router) {}

  ngOnInit(): void {

    this.loadProducts();
  }

  loadProducts(): void {
    this.productService.getProducts().subscribe((data) => {
      this.products = data;
    });
  }

  createProduct() {
    this.router.navigate(['/create-product']);
  }

  editProduct(product: Product) {
    // Navigate to product form for editing the selected product
  }

  deleteProduct(id: number) {
    this.productService.deleteProduct(id).subscribe(() => this.loadProducts());
  }
}
