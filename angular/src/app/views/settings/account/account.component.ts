import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {ToastrService} from "ngx-toastr";
import {AuthService} from "../../../shared/services/auth.service";

@Component({
  selector: 'app-account',
  templateUrl: './account.component.html',
  styleUrls: ['./account.component.scss']
})
export class AccountComponent implements OnInit{
  loading: boolean;
  constructor(
      private formBuilder: FormBuilder,
      private toastr: ToastrService,
      private authService: AuthService,
  ) { }
  updatePasswordForm = this.formBuilder.group({
        newPassword: ['', [Validators.required, Validators.maxLength(50), Validators.minLength(8)]],
        cPassword: ['', [Validators.required]],
      },
      {
        validator: this.ConfirmedValidator('newPassword', 'cPassword'),
      }
  );
  ngOnInit() {
    this.updatePasswordForm.controls.newPassword.valueChanges.subscribe(() => {
      this.updatePasswordForm.controls.cPassword.updateValueAndValidity();
    });
  }
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
  updatePassword(){
    this.loading = true;
    if(this.updatePasswordForm.valid) {
      this.authService.updatePassword(this.updatePasswordForm.value.newPassword).subscribe({
        next: () => {
          this.loading = false;
          this.toastr.success('Password updated successfully');
          console.log('Password updated successfully');
        },
        error: (err) => {
          this.loading = false;
          this.toastr.error('Failed to update password');
          console.log('Failed to update password');
        }
      });
    }else{
        this.loading = false;
        this.toastr.error('Invalid password');
        console.log('Invalid password');
    }
  }
}
