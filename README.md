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
    implementation 'org.springframework.cloud:spring-cloud-starter-netflix-eureka-client'
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


- 스프링 부트 버전: ``id 'org.springframework.boot' version '2.7.5'``
- 이 서비스에 사용할 스프링 클라우드 프로젝트: ``'org.springframework.cloud:spring-cloud-config-server'``
- 컨피스 서비스도 레지스트리로 등록할 것임: ``'org.springframework.cloud:spring-cloud-starter-netflix-eureka-client'``
