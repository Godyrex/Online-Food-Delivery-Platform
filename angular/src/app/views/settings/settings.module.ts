import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SettingsRoutingModule } from './settings-routing.module';
import { ProfileComponent } from './profile/profile.component';
import {SharedComponentsModule} from "../../shared/components/shared-components.module";
import {ReactiveFormsModule} from "@angular/forms";


@NgModule({
  declarations: [
    ProfileComponent
  ],
    imports: [
        CommonModule,
        SettingsRoutingModule,
        SharedComponentsModule,
        ReactiveFormsModule
    ]
})
export class SettingsModule { }
