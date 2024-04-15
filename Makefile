build-image-service1:
	./mvnw spring-boot:build-image -pl service1

pack-image-service1:
	pack build service1:2.0-SNAPSHOT  --builder=paketobuildpacks/builder-jammy-full  --env BP_MAVEN_BUILT_MODULE=service1 --env BP_MAVEN_BUILD_ARGUMENTS="-Dmaven.test.skip=true package -pl parent-project,core,service1" --env BP_JVM_VERSION=21

build-image-service2:
	./mvnw spring-boot:build-image -pl service2

start-image-service1:
	docker run  -p 8081:8080 service1:1.0-SNAPSHOT

start-image-service1-pack:
	docker run  -p 8081:8080 service1:2.0-SNAPSHOT

start-image-service2:
	docker run  -p 8082:8080 service2:1.0-SNAPSHOT

call-service1:
	curl -X GET --location "http://localhost:8081/customers"

call-service2:
	curl -X GET --location "http://localhost:8082/customer"

build-cnb:
	docker run -v /var/run/docker.sock.raw:/var/run/docker.sock -v .:/workspace -w /workspace buildpacksio/pack build simple-project-service1 --path . --builder=paketobuildpacks/builder-jammy-full --env BP_MAVEN_BUILT_MODULE=service1 --env BP_MAVEN_BUILD_ARGUMENTS="-Dmaven.test.skip=true package -pl service1 -am" --env BP_JVM_VERSION=21  --tag=simple-demo:latest