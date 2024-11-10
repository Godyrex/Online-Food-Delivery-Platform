package com.example.user.controllers;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.example.user.models.UserProfile;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.util.Enumeration;
import java.util.Map;

@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {

    @Autowired
    private RestTemplate restTemplate;

    @Value("${keycloak.admin.url}")
    private String keycloakAdminUrl;

    @Value("${keycloak.admin.clientId}")
    private String keycloakAdminClientId;

    @Value("${keycloak.admin.clientSecret}")
    private String keycloakAdminClientSecret;

    @Value("${keycloak.realm}")
    private String keycloakRealm;

    // Method to get the admin access token
    public String getAdminAccessToken() {
        log.info("Getting admin access token");
        String tokenUrl = keycloakAdminUrl + "/realms/" + keycloakRealm + "/protocol/openid-connect/token";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        // Use MultiValueMap instead of Map for form parameters
        MultiValueMap<String, String> formParams = new LinkedMultiValueMap<>();
        formParams.add("client_id", keycloakAdminClientId);
        formParams.add("client_secret", keycloakAdminClientSecret);
        formParams.add("grant_type", "client_credentials");

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(formParams, headers);

        try {
            ResponseEntity<Map> response = restTemplate.postForEntity(tokenUrl, request, Map.class);
            log.info("Response: {}", response);
            if (response.getStatusCode().is2xxSuccessful()) {
                Map<String, String> responseBody = response.getBody();
                return responseBody != null ? responseBody.get("access_token") : null;
            } else {
                return null;
            }
        } catch (RestClientException e) {
            log.error("Failed to retrieve access token", e);
            return null;
        }
    }

    // Method to update the user profile using Admin API
    @PutMapping("/profile")
    public ResponseEntity<String> updateUserProfile(HttpServletRequest request, @RequestBody UserProfile profile) {

        // Extract the Authorization header
        String authorizationHeader = request.getHeader("Authorization");
        if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {
            String token = authorizationHeader.substring(7);
            DecodedJWT jwt = JWT.decode(token);
            String userId = jwt.getSubject(); // Extract the 'sub' claim
            log.info("Updating user profile for user: {}", userId);

            String adminToken = getAdminAccessToken();
            log.info("Admin access token: {}", adminToken);
            String url = keycloakAdminUrl + "/admin/realms/" + keycloakRealm + "/users/" + userId;
            log.info("URL: {}", url);
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + adminToken);
            headers.set("Content-Type", "application/json");

            HttpEntity<UserProfile> requestEntity = new HttpEntity<>(profile, headers);

            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.PUT, requestEntity, String.class);
            return new ResponseEntity<>(response.getBody(), response.getStatusCode());
        } else {
            return new ResponseEntity<>("Authorization header is missing or invalid", HttpStatus.UNAUTHORIZED);
        }
    }
}

