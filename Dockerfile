FROM ubuntu:18.04

COPY my-app/target/testing-junit5-mockito-1.0.jar .

RUN apt-get update \
   
    && apt install default-jdk -y

   
    

CMD java -jar testing-junit5-mockito-1.0.jar
