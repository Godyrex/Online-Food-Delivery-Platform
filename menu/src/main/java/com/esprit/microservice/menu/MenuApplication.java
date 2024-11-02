package com.esprit.microservice.menu;

import com.esprit.microservice.menu.repository.MenuItemRepository;
import com.esprit.microservice.menu.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;


@EnableDiscoveryClient
@SpringBootApplication
public class MenuApplication {

	public static void main(String[] args) {
		SpringApplication.run(MenuApplication.class, args);
	}

	@Autowired
	private MenuRepository menuRepository;

	@Autowired
	private MenuItemRepository menuItemRepository;

	@Bean
	ApplicationRunner init() {
		return args -> {
			// Create some menu items//:/
//			menuRepository.save(new Menu("Salade"));
//			menuRepository.findAll().forEach(System.out::println);
//			menuItemRepository.save(new MenuItem("Salade", 10.0, "Le produit est de qualité"));
//			menuItemRepository.save(new MenuItem("Pizza", 15.0, "La pizza est de qualité"));
//			menuItemRepository.save(new MenuItem("Burger", 12.0, "Le burger est de qualité"));
//
//			// Create a menu with menu items
//			Menu menu = new Menu("Menu du jour");
//			menu.addItem(menuItemRepository.findById(1L).get());
//			menu.addItem(menuItemRepository.findById(2L).get());
//			menu.addItem(menuItemRepository.findById(3L).get());
//
//			// Save the menu
//			menuRepository.save(menu);
		};
	}


}
