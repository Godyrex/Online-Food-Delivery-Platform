import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface Menu {
  menuId: number;
  restaurantName: string;
  cuisineType?: string;
  description?: string;
  menuType?: string;
  contactNumber?: string;
  averagePreparationTime?: number;
  items?: any[];
}

@Injectable({
  providedIn: 'root'
})
export class MenuService {
  private apiUrl = `${environment.apiUrl}/menus`;
  //private apiUrl = 'http://localhost:8093/menus';

  constructor(private http: HttpClient) {}

  // Get all menus
  getAllMenus(): Observable<Menu[]> {
    return this.http.get<Menu[]>(this.apiUrl);
  }

  // Get a menu by ID
  getMenuById(menuId: number): Observable<Menu> {
    return this.http.get<Menu>(`${this.apiUrl}/${menuId}`);
  }

  // Create a new menu
  createMenu(menu: Menu): Observable<Menu> {
    return this.http.post<Menu>(this.apiUrl, menu);
  }

  // Update a menu by ID
  updateMenu(menuId: number, menu: Menu): Observable<Menu> {
    return this.http.put<Menu>(`${this.apiUrl}/${menuId}`, menu);
  }

  // Delete a menu by ID
  deleteMenu(menuId: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${menuId}`);
  }


}
