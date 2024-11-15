package com.example.apigateway.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/register")
@Slf4j
@CrossOrigin(origins = "http://localhost:4200")
public class RegistrationController {

    private final RestTemplate restTemplate;

    // Keycloak details, populated from application.properties
    @Value("${keycloak.auth-server-url}")
    private String keycloakUrl;

    @Value("${keycloak.realm}")
    private String realm;

    @Value("${keycloak.resource}")
    private String clientId;

    @Value("${keycloak.credentials.secret}")
    private String clientSecret;

    @Value("${keycloak-admin.username}")
    private String adminUsername;

    @Value("${keycloak-admin.password}")
    private String adminPassword;

    public RegistrationController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @PostMapping
    public ResponseEntity<?> registerUser(@RequestBody Map<String, String> registrationRequest) {
        // Get the admin access token
        log.info("Registering user: {}", registrationRequest);
        String adminToken = getAdminAccessToken();
        if (adminToken == null) {
            return ResponseEntity.status(500).body("Failed to obtain admin token");
        }

        // Set headers
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + adminToken);
        headers.set("Content-Type", "application/json");

        // Build user creation request payload
        Map<String, Object> userPayload = new HashMap<>();
        userPayload.put("username", registrationRequest.get("username"));
        userPayload.put("email", registrationRequest.get("email"));
        userPayload.put("enabled", true);

        Map<String, Object> credentials = new HashMap<>();
        credentials.put("type", "password");
        credentials.put("value", registrationRequest.get("password"));
        credentials.put("temporary", false);

        userPayload.put("credentials", List.of(credentials));

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(userPayload, headers);

        // Make the request to Keycloak's admin API to create the user
        String keycloakCreateUserUrl = keycloakUrl + "/admin/realms/" + realm + "/users";
        try {
            return restTemplate.postForEntity(keycloakCreateUserUrl, request, String.class);
        } catch (HttpClientErrorException e) {
                return ResponseEntity.status(e.getStatusCode()).body(e.getResponseBodyAsString());
        }
    }

    public String getAdminAccessToken() {
        log.info("Getting admin access token");
        String tokenUrl = keycloakUrl + "/realms/" + realm + "/protocol/openid-connect/token";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        // Use MultiValueMap instead of Map for form parameters
        MultiValueMap<String, String> formParams = new LinkedMultiValueMap<>();
        formParams.add("client_id", clientId);
        formParams.add("client_secret", clientSecret);
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
    @GetMapping("/test")
    public String test() {
        return "API Gateway is working!";
    }
}

