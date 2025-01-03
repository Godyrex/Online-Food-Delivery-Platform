import {Component, OnInit} from '@angular/core';
import {SharedAnimations} from 'src/app/shared/animations/shared-animations';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {AuthService} from '../../../shared/services/auth.service';
import {ResolveEnd, ResolveStart, RouteConfigLoadEnd, RouteConfigLoadStart, Router} from '@angular/router';
import {ToastrService} from "ngx-toastr";

@Component({
    selector: 'app-signin',
    templateUrl: './signin.component.html',
    styleUrls: ['./signin.component.scss'],
    animations: [SharedAnimations]
})
export class SigninComponent implements OnInit {
    loading: boolean;
    loadingText: string;
    signinForm: FormGroup;
    username: string = '';
    password: string = '';
    constructor(
        private fb: FormBuilder,
        private auth: AuthService,
        private router: Router,
        private toastr: ToastrService
    ) { }

    ngOnInit() {
        if(this.auth.authenticated){
            this.toastr.info('You are already logged in');
            this.router.navigateByUrl("/dashboard/v1");
        }
        this.router.events.subscribe(event => {
            if (event instanceof RouteConfigLoadStart || event instanceof ResolveStart) {
                this.loadingText = 'Loading Dashboard Module...';

                this.loading = true;
            }
            if (event instanceof RouteConfigLoadEnd || event instanceof ResolveEnd) {
                this.loading = false;
            }
        });

        this.signinForm = this.fb.group({
            username: ['oussema123', Validators.required],
            password: ['1234', Validators.required]
        });
    }

    login() {
        this.username = this.signinForm.get('username').value;
        this.password = this.signinForm.get('password').value;
        this.auth.login(this.username, this.password).subscribe(response => {
            if (response) {
                const token = response.access_token;
                this.auth.user = JSON.parse(atob(token.split('.')[1])); // Save the decoded user information in AuthService
                this.router.navigate(['/dashboard/v1']); // Navigate to a protected route after successful login
            } else {
                this.toastr.error('Invalid username or password');
            }
        });
    }

}
