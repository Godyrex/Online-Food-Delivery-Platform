package com.example.chat.config;



import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        // Autoriser toutes les demandes venant de localhost:4200 (ou de ton domaine frontend)
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:4200") // Ton frontend Angular
                .allowedMethods("GET", "POST", "PUT", "DELETE") // Les méthodes HTTP autorisées
                .allowedHeaders("*") // Autoriser tous les headers
                .allowCredentials(true); // Autoriser les cookies et l'authentification
    }
}

