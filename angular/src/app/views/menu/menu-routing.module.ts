import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MenuListComponent } from '../../components/menu-list/menu-list.component';
import { MenuFormComponent } from '../../components/menu-form/menu-form.component';
import {MenuEditComponent} from '../../components/menu-edit/menu-edit.component';

const routes: Routes = [
    { path: '', component: MenuListComponent },
    { path: 'create', component: MenuFormComponent }, // Route for creating a new menu
    { path: 'edit/:menuId', component: MenuEditComponent }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class MenuRoutingModule { }
