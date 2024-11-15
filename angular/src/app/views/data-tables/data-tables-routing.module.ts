import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FullscreenTableComponent } from './fullscreen-table/fullscreen-table.component';
import { PagingTableComponent } from './paging-table/paging-table.component';
import { FilterTableComponent } from './filter-table/filter-table.component';
import { ListPaginationComponent } from './list-pagination/list-pagination.component';
import {ProductComponent} from "./product/product.component";
import {CreateOrderComponent} from "./create-order/create-order.component";
import {CreateProductComponent} from "../forms/create-product/create-product.component";
import {OrderListComponent} from "./order-list/order-list.component";

const routes: Routes = [
  {
    path: 'list',
    component: ListPaginationComponent
  },
  {
    path: 'full',
    component: FullscreenTableComponent
  },
  {
    path: 'paging',
    component: PagingTableComponent
  },
  {
    path: 'filter',
    component: FilterTableComponent
  },
    {
      path: 'Product',
        component: ProductComponent
    },
  {
    path:'createProduct',
    component:CreateProductComponent
  },
  {
    path:'createOrder',
    component:CreateOrderComponent
  },
  {
    path:'orderList',
    component:OrderListComponent
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DataTablesRoutingModule { }
