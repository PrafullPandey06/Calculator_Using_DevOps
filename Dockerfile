FROM khipu/openjdk17-alpine
COPY . .
WORKDIR ./
CMD ["java","-jar", "target/calculator-1.0-SNAPSHOT-jar-with-dependencies.jar"]

