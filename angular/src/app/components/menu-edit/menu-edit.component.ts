import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { MenuService } from '../../services/menu.service';

@Component({
  selector: 'app-menu-edit',
  templateUrl: './menu-edit.component.html',
  styleUrls: ['./menu-edit.component.scss']
})
export class MenuEditComponent implements OnInit {
  menuForm: FormGroup;
  menuId: number;

  constructor(
      private fb: FormBuilder,
      private route: ActivatedRoute,
      private menuService: MenuService,
      private router: Router
  ) {}

  ngOnInit(): void {
    this.menuId = +this.route.snapshot.paramMap.get('menuId');
    this.menuForm = this.fb.group({
      restaurantName: ['', Validators.required],
      cuisineType: ['', Validators.required],
      description: ['', Validators.required],
      menuType: ['', Validators.required],
      contactNumber: ['', [Validators.required, Validators.pattern('[0-9]+')]],
      averagePreparationTime: ['', [Validators.required, Validators.min(1)]]
    });

    // Load the menu data
    this.menuService.getMenuById(this.menuId).subscribe(menu => {
      this.menuForm.patchValue(menu);
    });
  }

  submit() {
    if (this.menuForm.valid) {
      this.menuService.updateMenu(this.menuId, this.menuForm.value).subscribe(() => {
        this.router.navigate(['/menu']);
      });
    }
  }
}
