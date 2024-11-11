import { Component, OnInit } from '@angular/core';
import { SharedAnimations } from 'src/app/shared/animations/shared-animations';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {ToastrService} from "ngx-toastr";
import {AuthService} from "../../../shared/services/auth.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss'],
  animations: [SharedAnimations]
})
export class SignupComponent implements OnInit {

  constructor(   private authService: AuthService,
                 private formBuilder: FormBuilder,
                 private toastr: ToastrService,
                 private router : Router
  ) { }
  signupForm = this.formBuilder.group({
        email: ['', [Validators.required, Validators.email]],
        username: ['', [Validators.required, Validators.maxLength(20), Validators.minLength(3)]],
        password: ['', [Validators.required, Validators.maxLength(50), Validators.minLength(8)]],
        confirmPassword: ['', [Validators.required]],
      },
      {
        validator: this.ConfirmedValidator('password', 'confirmPassword'),
      }
  );
  ConfirmedValidator(controlName: string, matchingControlName: string) {
    return (formGroup: FormGroup) => {
      const control = formGroup.controls[controlName];
      const matchingControl = formGroup.controls[matchingControlName];
      if (matchingControl.errors) {
        return;
      }
      if (control.value !== matchingControl.value) {
        matchingControl.setErrors({confirmedValidator: true});
      } else {
        matchingControl.setErrors(null);
      }
    };
  }
  saveUser(){
    if (this.signupForm.invalid) {
      this.toastr.error('Please fill the form correctly');
      return;
    }
    this.authService.signup(this.signupForm.value.username, this.signupForm.value.password, this.signupForm.value.email).subscribe(
        response => {
            this.toastr.success('User created successfully');
        },error => {
            this.toastr.error(error.error.errorMessage);
        }
    );
  }
  ngOnInit() {
      if(this.authService.authenticated){
            this.toastr.info('You are already logged in');
          this.router.navigateByUrl("/dashboard/v1");
      }
    this.signupForm.controls.password.valueChanges.subscribe(() => {
      this.signupForm.controls.confirmPassword.updateValueAndValidity();
    });
  }

}
