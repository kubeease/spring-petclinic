FROM registry.cn-hangzhou.aliyuncs.com/leo_library/openjdk:8-jdk-cnzone-with-systool
COPY target/*.jar /app/
WORKDIR /app
ENV JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=2 -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=256m"
ENV SPRING_PROFILE="default"
#ENV APM_OPTS="-javaagent:/usr/local/java/lib/agent/skywalking-agent.jar"

ENV SPRING_OPTS=""
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS $APM_OPTS -jar -Dspring.profiles.active=${SPRING_PROFILE} /app/*.jar $SPRING_OPTS"]
