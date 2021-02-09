FROM alpine

COPY my-app/target/testing-junit5-mockito-1.0.jar .

RUN apk update \
   
    && apk add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

EXPOSE 8080   
    

CMD java -jar testing-junit5-mockito-1.0.jar
