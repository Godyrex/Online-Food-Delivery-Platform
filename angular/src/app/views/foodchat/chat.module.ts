import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ChatRoutingModule } from './chat-routing.module';

import { PerfectScrollbarModule } from 'ngx-perfect-scrollbar';
import { FormsModule } from '@angular/forms';
import { SharedDirectivesModule } from 'src/app/shared/directives/shared-directives.module';
import { SharedPipesModule } from 'src/app/shared/pipes/shared-pipes.module';
import {ChatComponent} from './chat.component';
@NgModule({
  imports: [
    CommonModule,
    SharedDirectivesModule,
    SharedPipesModule,
    FormsModule,
    PerfectScrollbarModule,
    ChatRoutingModule,
    ChatComponent
  ],
  declarations: []
})
export class ChatModule { }
