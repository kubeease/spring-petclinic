FROM gcr.io/distroless/java:11
COPY target/*.jar /app/
WORKDIR /app
ENV SPRING_PROFILE="default"

ENV SPRING_OPTS=""
ENTRYPOINT [ "/usr/bin/java" ]
CMD ["-jar", "-Dspring.profiles.active=${SPRING_PROFILE}", "/app/spring-petclinic-2.4.5.jar", "${SPRING_OPTS}"]
