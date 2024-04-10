build-image-service1:
	./mvnw spring-boot:build-image -pl service1

build-image-service2:
	./mvnw spring-boot:build-image -pl service2

start-image-service1:
	docker run  -p 8081:8080 service1:1.0-SNAPSHOT

start-image-service2:
	docker run  -p 8082:8080 service2:1.0-SNAPSHOT

call-service1:
	curl -X GET --location "http://localhost:8081/customers"

call-service2:
	curl -X GET --location "http://localhost:8082/customer"