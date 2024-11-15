# Online-Food-Delivery-Platform

This is a Spring Boot application designed for managing food-delivery. The project includes Docker support for easy deployment.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Java 17+](https://adoptium.net/)
- [Docker](https://www.docker.com/get-started)

## Getting Started

### 1. Clone the Repository

```bash
git clone <repository_url>
cd <repository_directory>
```

### 2. Build the Docker Image

To build the Docker image for the application, run the following command:

```bash
docker build -t reservation:1.1 .
```

### 3. Run the Application

#### Option 1: Run in Foreground

This will run the application and display logs in the terminal:

```bash
docker run -p 8085:8085 reservation:1.1
```

The application will be accessible at `http://localhost:8085`.

#### Option 2: Run in Detached Mode

To run the application in the background:

```bash
docker run -d -p 8099:8085 --name reservation_instance_x reservation:1.1
```

This will expose the application on `http://localhost:8099`.

## Stopping the Application

To stop the running container:

```bash
docker stop reservation_instance_x
```

To remove the container:

```bash
docker rm reservation_instance_x
```

## Additional Notes

- The `Dockerfile` is pre-configured for this project.
- Update the `application.properties` for custom configurations.
- Feel free to use `docker-compose` for managing multiple instances in the future.

## License

This project is licensed under the [MIT License](LICENSE).
