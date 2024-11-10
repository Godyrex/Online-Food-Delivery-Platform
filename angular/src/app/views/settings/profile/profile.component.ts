import {Component, OnInit} from '@angular/core';
import {FormBuilder, Validators} from "@angular/forms";
import {ToastrService} from "ngx-toastr";
import {AuthService} from "../../../shared/services/auth.service";
import {HttpClient} from "@angular/common/http";

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit{
  loading: boolean=false;
  constructor(
      private formBuilder: FormBuilder,
      private toastr: ToastrService,
      private auth: AuthService,
        private http: HttpClient
  ) {}
  informationForm = this.formBuilder.group({
        name: [' ', [Validators.required, Validators.maxLength(20), Validators.minLength(3)]],
        lastname: ['', [Validators.required, Validators.maxLength(20), Validators.minLength(3)]],
      }
  );
  ngOnInit(): void {
   /*   this.http.get('http://localhost:8099/demo/test').subscribe(
            response => {
                console.log('Response from server: ', response);
                this.toastr.info('Response from server: ' + response['message']);
            },error => {
                console.log('Failed to get response from server', error);
                this.toastr.error('Failed to get response from server');
            }
        )*/
    this.auth.getUserInfo().subscribe(
        response => {
          console.log("User info: ",response)
          if(response['family_name']){
            this.informationForm.patchValue({
              lastname: response['family_name'],
            });
          }
            if(response['given_name']){
                this.informationForm.patchValue({
                name: response['given_name'],
                });
            }
        }
    )
    }
    updateProfile() {
      this.loading = true;
        this.auth.updateUserProfile(this.informationForm.value.name, this.informationForm.value.lastname)
            .subscribe({
                next: () => {
                    this.loading = false;
                    this.toastr.success('Profile updated successfully');
                    console.log('Profile updated successfully');
                },
                error: (err) => {
                    this.loading = false;
                    this.toastr.error('Failed to update profile');
                    console.error('Failed to update profile', err);
                }
            });
    }
}
