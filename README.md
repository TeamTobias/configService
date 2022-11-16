# 구성 관리 서비스

```groovy
plugins {
    id 'java'
    id 'org.springframework.boot' version '2.7.5'
    id 'io.spring.dependency-management' version '1.0.15.RELEASE'
}

group = 'com.tobias'
version = '0.0.1-SNAPSHOT'
sourceCompatibility = '17'

repositories {
    mavenCentral()
}

ext {
    set('springCloudVersion', "2021.0.5")
}

dependencies {
    implementation 'org.springframework.cloud:spring-cloud-config-server'
    implementation 'org.springframework.boot:spring-boot-starter-actuator'
    developmentOnly 'org.springframework.boot:spring-boot-devtools'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
}

dependencyManagement {
    imports {
        mavenBom "org.springframework.cloud:spring-cloud-dependencies:${springCloudVersion}"
    }
}

tasks.named('test') {
    useJUnitPlatform()
}
```

- `spring-cloud-config-server` : 구성 관리 서비스를 제공하는 라이브러리
- `spring-boot-starter-actuator` : 애플리케이션의 상태를 확인할 수 있는 엔드포인트를 제공하는 라이브러리
- `spring-cloud-dependencies` : Spring Cloud의 버전을 관리하는 라이브러리
- `spring-boot-devtools` : 개발 시에만 사용하는 라이브러리
- `spring-boot-starter-test` : 테스트를 위한 라이브러리


<br/>
---------------

```java
@SpringBootApplication
@EnableConfigServer
public class ConfigServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(ConfigServiceApplication.class, args);
    }

}
```

- ``@SpringBootApplication``: 스프링 부트 애플리케이션임을 알림
- ``@EnableConfigServer``: 컨피스 서버로 사용할 것임을 알림


<br/>
---------------

