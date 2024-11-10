import {Injectable} from '@angular/core';
import {HttpErrorResponse, HttpEvent, HttpHandler, HttpInterceptor, HttpRequest} from '@angular/common/http';
import {BehaviorSubject, Observable, throwError} from 'rxjs';
import {LocalStoreService} from "./local-store.service";
import {AuthService} from "./auth.service";
import {catchError, switchMap} from "rxjs/operators";



@Injectable()
export class AuthInterceptor implements HttpInterceptor {
    private isRefreshing = false; // Tracks if a token refresh is already in progress
    private refreshTokenSubject: BehaviorSubject<string | null> = new BehaviorSubject<string | null>(null);

    constructor(private store: LocalStoreService, private authService: AuthService) {}

    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        const accessToken = this.store.getItem('access_token');

        // Add the access token to the headers if it exists
        if (accessToken) {
            req = this.addToken(req, accessToken);
        }

        return next.handle(req).pipe(
            catchError((error: HttpErrorResponse) => {
                console.log('Error in interceptor: ', error);
                // If a 401 error occurs, try refreshing the token
                if (error.status === 401 || error.status === 0 && !this.isRefreshing) {
                    console.log('Refreshing token...');
                    this.isRefreshing = true;
                    this.refreshTokenSubject.next(null);

                    // Attempt to refresh the access token
                    return this.authService.refreshAccessToken().pipe(
                        switchMap((tokens: any) => {
                            this.isRefreshing = false;
                            this.refreshTokenSubject.next(tokens.access_token);

                            // Update the request with the new access token
                            return next.handle(this.addToken(req, tokens.access_token));
                        }),
                        catchError((refreshError) => {
                            this.isRefreshing = false;
                            this.authService.signout(); // Log out the user if refreshing fails
                            return throwError(() => refreshError);
                        })
                    );
                } else {
                    return throwError(() => error); // Return error if not a 401 or refresh is already in progress
                }
            })
        );
    }

    // Helper method to add the access token to headers
    private addToken(req: HttpRequest<any>, token: string): HttpRequest<any> {
        return req.clone({
            setHeaders: {
                Authorization: `Bearer ${token}`,
            },
        });
    }
}
