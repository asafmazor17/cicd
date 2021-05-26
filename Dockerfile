##Step 1

FROM newtmitch/sonar-scanner as sonarqube
WORKDIR /usr/src
COPY * ./
RUN sonar-scanner -Dsonar.projectBaseDir=/usr/src

##Step 2


FROM openjdk:8 as jdk
WORKDIR /usr/src
COPY ./script.sh /usr/src
RUN chmod +x /usr/src/script.sh
RUN bash script.sh
WORKDIR /usr/src/spring-petclinic
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "java -jar target/*.jar"]