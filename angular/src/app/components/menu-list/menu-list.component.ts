import { Component, OnInit } from '@angular/core';
import { MenuService, Menu } from '../../services/menu.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-menu-list',
  templateUrl: './menu-list.component.html',
  styleUrls: ['./menu-list.component.scss'],
})
export class MenuListComponent implements OnInit {
  menus: Menu[] = [];
  searchTerm: string = '';
  page: number = 1;
  pageSize: number = 4;

  constructor(private menuService: MenuService, private router: Router) {}

  ngOnInit() {
    this.menuService.getAllMenus().subscribe((data: Menu[]) => {
      this.menus = data;
    });
  }

  filteredMenus() {
    const search = this.searchTerm.toLowerCase();
    return this.menus
        .filter(
            (menu) =>
                menu.restaurantName.toLowerCase().includes(search) ||
                menu.cuisineType?.toLowerCase().includes(search) ||
                menu.description?.toLowerCase().includes(search)
        )
        .slice((this.page - 1) * this.pageSize, this.page * this.pageSize);
  }

  deleteMenu(menuId: number): void {
    if (confirm('Are you sure you want to delete this menu?')) {
      this.menuService.deleteMenu(menuId).subscribe(
          () => {
            console.log(`Menu with ID ${menuId} deleted successfully`);
            this.menus = this.menus.filter(menu => menu.menuId !== menuId);
          },
          (error) => console.error('Error deleting menu:', error)
      );
    }
  }
  editMenu(menuId: number) {
    this.router.navigate(['/menu/edit', menuId]);
  }
}
