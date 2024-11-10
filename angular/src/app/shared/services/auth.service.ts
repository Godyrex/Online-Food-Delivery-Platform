import { Injectable } from "@angular/core";
import { LocalStoreService } from "./local-store.service";
import { Router } from "@angular/router";
import {Observable, of } from "rxjs";
import {catchError, delay, map } from "rxjs/operators";
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Injectable({
  providedIn: "root"
})
export class AuthService {
  //Only for demo purpose
  authenticated = true;
  private readonly tokenUrl = 'http://localhost:8080/realms/food-delivery/protocol/openid-connect/token';
  private readonly userUrl = 'http://localhost:8099';
  private readonly clientId = 'angular';
  constructor(private store: LocalStoreService, private router: Router,private http: HttpClient) {
    this.checkAuth();
  }

  checkAuth() {
    const token = this.store.getItem("access_token");
    this.authenticated = !!token;
  }

  getuser() {
    return of({});
  }
  login(username: string, password: string): Observable<any> {
    const body = new URLSearchParams();
    body.set('client_id', this.clientId);
    body.set('username', username);
    body.set('password', password);
    body.set('grant_type', 'password');

    const headers = new HttpHeaders({ 'Content-Type': 'application/x-www-form-urlencoded' });

    return this.http.post(this.tokenUrl, body.toString(), { headers }).pipe(
        map((response: any) => {
          this.store.setItem("access_token", response.access_token);
          this.store.setItem("refresh_token", response.refresh_token);
          this.authenticated = true;
          return response;
        }),
        catchError(error => {
          console.error('Login failed', error);
          return of(null); // Return null or an error message as needed
        })
    );
  }
  signup(username: string, password: string, email: string): Observable<any> {
    const body = {
      username: username,
      email: email,
      password: password
    };

    return this.http.post(`${this.userUrl}/register`, body);
  }

  signout() {
    this.authenticated = false;
    this.store.removeItem("access_token");
    this.store.removeItem("refresh_token");
    this.router.navigateByUrl("/sessions/signin");
  }
}
