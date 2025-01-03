import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthLayoutComponent } from './shared/components/layouts/auth-layout/auth-layout.component';
import { AuthGuard } from './shared/services/auth.guard';
import { BlankLayoutComponent } from './shared/components/layouts/blank-layout/blank-layout.component';
import { AdminLayoutSidebarCompactComponent } from './shared/components/layouts/admin-layout-sidebar-compact/admin-layout-sidebar-compact.component';
import {EditProductComponent} from "./views/forms/edit-product/edit-product.component";
import {CreateProductComponent} from "./views/forms/create-product/create-product.component";
import {ProductComponent} from "./views/data-tables/product/product.component";
import {ProductFormComponent} from "./views/forms/product-form/product-form.component";
import {ChatComponent} from './views/foodchat/chat.component';

const adminRoutes: Routes = [
    {
      path: 'dashboard',
      loadChildren: () => import('./views/dashboard/dashboard.module').then(m => m.DashboardModule)
    },
    {
      path: 'uikits',
      loadChildren: () => import('./views/ui-kits/ui-kits.module').then(m => m.UiKitsModule)
    },
    {
      path: 'forms',
      loadChildren: () => import('./views/forms/forms.module').then(m => m.AppFormsModule)
    },
    {
      path: 'invoice',
      loadChildren: () => import('./views/invoice/invoice.module').then(m => m.InvoiceModule)
    },
    {
      path: 'inbox',
      loadChildren: () => import('./views/inbox/inbox.module').then(m => m.InboxModule)
    },
    {
      path: 'calendar',
      loadChildren: () => import('./views/calendar/calendar.module').then(m => m.CalendarAppModule)
    },
    {
      path: 'chat',
      loadChildren: () => import('./views/foodchat/chat.module').then(m => m.ChatModule)
    },
    {
      path: 'contacts',
      loadChildren: () => import('./views/contacts/contacts.module').then(m => m.ContactsModule)
    },
    {
      path: 'tables',
      loadChildren: () => import('./views/data-tables/data-tables.module').then(m => m.DataTablesModule)
    },
    {
      path: 'pages',
      loadChildren: () => import('./views/pages/pages.module').then(m => m.PagesModule)
    },
    {
        path: 'icons',
        loadChildren: () => import('./views/icons/icons.module').then(m => m.IconsModule)
    },
    { path: 'products/new', component: ProductFormComponent },
    { path: 'products/edit/:id', component: ProductFormComponent },
    { path: 'products/create', component: CreateProductComponent },
    { path: 'products/edit/:id', component: EditProductComponent },
    { path: 'products', component: ProductComponent },
    { path: '', redirectTo: '/products', pathMatch: 'full' },
    {
        path: 'settings',
        loadChildren: () => import('./views/settings/settings.module').then(m => m.SettingsModule)
    },
  ];

const routes: Routes = [
  {
    path: '',
    redirectTo: 'dashboard/v1',
    pathMatch: 'full'
  },
    {
    path: '',
    component: AuthLayoutComponent,
    children: [
      {
        path: 'sessions',
        loadChildren: () => import('./views/sessions/sessions.module').then(m => m.SessionsModule)
      }
    ]
  },
  {
    path: '',
    component: BlankLayoutComponent,
    children: [
      {
        path: 'others',
        loadChildren: () => import('./views/others/others.module').then(m => m.OthersModule)
      }
    ]
  },
  {
    path: '',
    component: AdminLayoutSidebarCompactComponent,
    canActivate: [AuthGuard],
    children: adminRoutes
  },
    {
        path: 'chat',
        component: ChatComponent
    },
  {
    path: '**',
    redirectTo: 'others/404'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { useHash: false })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
