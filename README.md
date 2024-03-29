# 구성 관리 서비스

```groovy
plugins {
    id 'java'
    id 'org.springframework.boot' version '2.7.5'
    id 'io.spring.dependency-management' version '1.0.15.RELEASE'
}

group = 'com.tobias'
version = '0.0.1-SNAPSHOT'

repositories {
    mavenCentral()
}

ext {
    set('springCloudVersion', "2021.0.5")
}

dependencies {
    implementation 'org.springframework.cloud:spring-cloud-config-server'
    implementation 'org.springframework.boot:spring-boot-starter-actuator'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
    implementation 'org.springframework.cloud:spring-cloud-starter-bus-amqp:3.1.2'
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
- `spring-cloud-starter-bus-amqp` : RabbitMQ를 이용한 메시지 브로커를 사용하기 위한 라이브러리

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

```yaml
server:
  port: 8888

spring:
  cloud:
    config:
      server:
        encrypt.enabled: false
        git:
          uri: org-117899436@github.com:TeamTobias/config-Repo.git
          ignore-local-ssh-settings: true
          private-key: |
            -----BEGIN RSA PRIVATE KEY-----
            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
            -----END RSA PRIVATE KEY-----
          search-paths: basketService,client_Service,client_loginService,couponService,deliveryService,manager_Service,manager_loginService,orderService,pointService,product_cudService,product_readService,recentlyviewedService,review_cudService,review_readService,saler_Service,saler_loginService
  rabbitmq:
    host: 127.0.01
    port: 5672
    username: guest
    password: guest


management:
  endpoints:
    web:
      exposure:
        include: "*"

#Setting logging levels
logging:
  level:
    com.netflix: WARN
    org.springframework.web: WARN
    com.tobias: DEBUG
```

- `server.port` : 서버의 포트를 설정
- `encrypt.enabled` : 암호화 사용 여부
- `spring.cloud.config.server.git.uri` : 구성 파일이 저장되어 있는 Git 저장소의 주소
- `ignore-local-ssh-settings` : 로컬 SSH 설정을 무시할 것인지 설정
- `private-key` : Git 저장소에 접근하기 위한 개인 키
- `search-paths` : Git 저장소에서 읽어올 구성 파일의 경로
- `spring.cloud.config.server.git.search-paths` : 구성 파일이 저장되어 있는 Git 저장소의 경로
- `management.endpoints.web.exposure.include` : Actuator의 엔드포인트를 노출할 것인지 설정
- `"*"` : 구성 파일을 갱신할 수 있는 엔드포인트, 구성 파일을 조회할 수 있는 엔드포인트를 모두 노출
- `logging.level` : 로깅 레벨을 설정
- `com.netflix` : Netflix 관련 로깅 레벨을 WARN으로 설정
- `org.springframework.web` : Spring Web 관련 로깅 레벨을 WARN으로 설정
- `com.tobias` : 애플리케이션 관련 로깅 레벨을 DEBUG로 설정
- `rabbitmq` : RabbitMQ 서버의 주소, 포트, 사용자 이름, 비밀번호를 설정
- `spring.rabbitmq.host` : RabbitMQ 서버의 주소
- `spring.rabbitmq.port` : RabbitMQ 서버의 포트
- `spring.rabbitmq.username` : RabbitMQ 서버의 사용자 이름
- `spring.rabbitmq.password` : RabbitMQ 서버의 비밀번호