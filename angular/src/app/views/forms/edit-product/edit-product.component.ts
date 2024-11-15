import { Component } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {Product, ProductService} from "../../../shared/services/product.service";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
  selector: 'app-edit-product',
  templateUrl: './edit-product.component.html',
  styleUrls: ['./edit-product.component.scss']
})
export class EditProductComponent {
  productForm: FormGroup;
  productId!: number;

  constructor(
      private formBuilder: FormBuilder,
      private productService: ProductService,
      private route: ActivatedRoute,
      private router: Router
  ) {
    this.productForm = this.formBuilder.group({
      name: ['', Validators.required],
      description: ['', Validators.required],
      price: [0, [Validators.required, Validators.min(0.01)]],
      category: ['', Validators.required]
    });
  }

  ngOnInit(): void {
    this.productId = +this.route.snapshot.paramMap.get('id')!;
    this.productService.getProductById(this.productId).subscribe((product: Product) => {
      this.productForm.patchValue(product);
    });
  }

  onSubmit(): void {
    if (this.productForm.valid) {
      const updatedProduct: Product = this.productForm.value;
      this.productService.updateProduct(this.productId, updatedProduct).subscribe({
        next: () => this.router.navigate(['/products']),
        error: (error) => console.error('Error updating product:', error)
      });
    }
  }
}
