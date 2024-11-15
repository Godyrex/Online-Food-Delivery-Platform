import { Component } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {Product, ProductService} from "../../../shared/services/product.service";
import {Router} from "@angular/router";
import {ToastrService} from "ngx-toastr";

@Component({
  selector: 'app-create-product',
  templateUrl: './create-product.component.html',
  styleUrls: ['./create-product.component.scss']
})
export class CreateProductComponent {
  productForm: FormGroup;

  constructor(
      private formBuilder: FormBuilder,
      private productService: ProductService,
      public router: Router,
      private toastr: ToastrService
  ) {
    this.productForm = this.formBuilder.group({
      name: ['', Validators.required],
      description: ['', Validators.required],
      price: [0, [Validators.required, Validators.min(0.01)]],
      category: ['', Validators.required]
    });
  }

  onSubmit(): void {
    if (this.productForm.valid) {
      this.productService.createProduct(this.productForm.value).subscribe(
          response => {
            this.toastr.success('Product created successfully!', 'Success');
            this.router.navigate(['/products']);
          },
          error => {
            this.toastr.error('Error creating product. Please try again.', 'Error');
            console.error('Error creating product', error);
          }
      );
    } else {
      this.toastr.warning('Please fill out all fields correctly.', 'Form Invalid');
    }
  }
}
