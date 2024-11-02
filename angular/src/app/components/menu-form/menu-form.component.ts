import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MenuService } from '../../services/menu.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-menu-form',
  templateUrl: './menu-form.component.html',
  styleUrls: ['./menu-form.component.scss']
})
export class MenuFormComponent implements OnInit {
  menuForm: FormGroup;

  constructor(
      private fb: FormBuilder,
      private menuService: MenuService,
      private router: Router
  ) {}

  ngOnInit() {
    this.menuForm = this.fb.group({
      restaurantName: ['', Validators.required],
      cuisineType: ['', Validators.required],
      description: ['', Validators.required],
      menuType: ['', Validators.required],
      contactNumber: ['', [Validators.required, Validators.pattern('[0-9]+')]],
      averagePreparationTime: ['', [Validators.required, Validators.min(1)]]
    });
  }

  submit() {
    if (this.menuForm.valid) {
      this.menuService.createMenu(this.menuForm.value).subscribe(
          response => {
            console.log("Menu created successfully:", response);
            // Navigate to menu list or display success message
            this.router.navigate(['/menu']);
          },
          error => {
            console.error("Error creating menu:", error);
          }
      );
    }
  }
}
