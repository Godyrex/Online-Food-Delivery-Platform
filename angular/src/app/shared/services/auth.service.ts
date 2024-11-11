import { LocalStoreService } from "./local-store.service";
import { Router } from "@angular/router";
import {Observable, of, throwError} from "rxjs";
import {catchError, delay, map, tap} from "rxjs/operators";
import {HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import {Injectable} from "@angular/core";

@Injectable({
  providedIn: "root"
})
export class AuthService {
  //Only for demo purpose
  authenticated = true;
  user: any;
  private readonly tokenUrl = 'http://localhost:8080/realms/food-delivery/protocol/openid-connect/token';
  private readonly userUrl = 'http://localhost:8099';
  private readonly keycloakUrl = 'http://localhost:8080/realms/food-delivery/protocol/openid-connect';
  private readonly clientId = 'angular';
  constructor(private store: LocalStoreService, private router: Router,private http: HttpClient) {
    this.checkAuth();
  }

  checkAuth() {
    const token = this.store.getItem("access_token");
    this.authenticated = !!token;
  }
  getUserInfo(){
    console.log("get user info");
    return this.http.get(this.keycloakUrl+'/userinfo').pipe(
        map(response => response),
        catchError(error => {
          console.error("Failed to fetch user info", error);
          return null;
        })
    );
  }
  updateUserProfile(firstName: string, lastName: string,email: string,attributes: { [key: string]: string }): Observable<any> {

      const body: any = {};
      if (firstName) body.firstName = firstName;
      if (lastName) body.lastName = lastName;
      if (email) body.email = email;
        if (attributes) body.attributes = attributes;

    return this.http.put('http://localhost:8099/user/profile', body);
  }

  login(username: string, password: string): Observable<any> {
    const body = new URLSearchParams();
    body.set('client_id', this.clientId);
    body.set('username', username);
    body.set('password', password);
    body.set('grant_type', 'password');
    body.set('scope', 'openid email profile address phone');

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
 updatePassword(newPassword: string): Observable<any> {
    return this.http.put(`${this.userUrl}/user/password`, newPassword);
  }
  signout() {
    this.authenticated = false;
    this.store.removeItem("access_token");
    this.store.removeItem("refresh_token");
    this.router.navigateByUrl("/sessions/signin");
  }
  refreshAccessToken(): Observable<any> {
    const refreshToken = this.store.getItem("refresh_token");
    if (!refreshToken) {
        console.log("No refresh token available");
      this.signout();
      return throwError(() => new Error('No refresh token available'));
    }

    const body = new HttpParams()
        .set('client_id', this.clientId)
        .set('grant_type', 'refresh_token')
        .set('refresh_token', refreshToken);

    const headers = new HttpHeaders({ 'Content-Type': 'application/x-www-form-urlencoded' });

    return this.http.post(this.tokenUrl, body.toString(), { headers }).pipe(
        tap((tokens: any) => {
            const token = tokens.access_token;
            this.user = JSON.parse(atob(token.split('.')[1]));
            this.store.setItem("access_token", tokens.access_token);
          this.store.setItem("refresh_token", tokens.refresh_token);
        }),
        catchError(error => {
          console.error("Token refresh failed", error);
          this.signout(); // Logout on failed refresh
          return throwError(() => error);
        })
    );
  }

}
