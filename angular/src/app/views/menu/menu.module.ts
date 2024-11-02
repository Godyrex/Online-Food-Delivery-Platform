import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { MenuListComponent } from '../../components/menu-list/menu-list.component';
import { MenuFormComponent } from '../../components/menu-form/menu-form.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import { MenuRoutingModule } from './menu-routing.module';
import {NgbPaginationModule} from '@ng-bootstrap/ng-bootstrap';

const routes: Routes = [
    { path: '', component: MenuListComponent }
];

@NgModule({
    declarations: [MenuListComponent, MenuFormComponent],
    imports: [
        CommonModule,
        RouterModule.forChild(routes),
        ReactiveFormsModule,
        MenuRoutingModule,
        NgbPaginationModule,
        FormsModule
    ]
})
export class MenuModule { }
