
FROM adoptopenjdk/openjdk11:x86_64-tumbleweed-jre-11.0.10_9

COPY my-app/target/testing-junit5-mockito-1.0.jar .

EXPOSE 8080   
    

CMD java -jar testing-junit5-mockito-1.0.jar
