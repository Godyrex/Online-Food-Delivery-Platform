import { Component } from '@angular/core';
import {FormBuilder, FormGroup} from "@angular/forms";
import {Product, ProductService} from "../../../shared/services/product.service";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
  selector: 'app-product-form',
  templateUrl: './product-form.component.html',
  styleUrls: ['./product-form.component.scss']
})
export class ProductFormComponent {
  productForm: FormGroup;
  productId?: number;

  constructor(
      private fb: FormBuilder,
      private productService: ProductService,
      private route: ActivatedRoute,
      private router: Router
  ) {
    this.productForm = this.fb.group({
      name: '',
      description: '',
      price: 0,
      category: ''
    });
  }

  ngOnInit(): void {
    this.productId = this.route.snapshot.params['id'];
    if (this.productId) {
      this.productService.getProductById(this.productId).subscribe((product) => {
        this.productForm.patchValue(product);
      });
    }
  }

  onSubmit(): void {
    const product: Product = this.productForm.value;
    if (this.productId) {
      this.productService.updateProduct(this.productId, product).subscribe(() => this.router.navigate(['/products']));
    } else {
      this.productService.createProduct(product).subscribe(() => this.router.navigate(['/products']));
    }
  }
}
