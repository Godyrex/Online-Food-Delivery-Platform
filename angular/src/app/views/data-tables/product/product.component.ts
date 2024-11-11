import { Component } from '@angular/core';
import {Product, ProductService} from "../../../shared/services/product.service";
import {OrderItem} from "../../../shared/services/order.service";
import {Router} from "@angular/router";
import {ToastrService} from "ngx-toastr";

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss']
})
export class ProductComponent {
  products: Product[] = [];

  constructor(private productService: ProductService,private router: Router,   private toastr: ToastrService ) {}

  ngOnInit(): void {

    this.loadProducts();
  }

  loadProducts(): void {
    this.productService.getProducts().subscribe((data) => {
      this.products = data;
    });
  }

  createProduct() {
    this.router.navigate(['products/create']);
  }

  editProduct(product: Product) {
    this.router.navigate([`/products/edit/${product.id}`]);
  }

  deleteProduct(id: number): void {
    this.productService.deleteProduct(id).subscribe({
      next: () => {
        this.toastr.success('Product deleted successfully!', 'Success');
        this.loadProducts(); // Reload products
      },
      error: (err) => {
        this.toastr.error('Error deleting product', 'Error');
        console.error('Error deleting product', err);
      }
    });
  }
}
