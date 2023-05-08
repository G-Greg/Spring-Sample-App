# Az alap image az OpenJDK 11-ben futó JRE
FROM openjdk:11-jre-slim

# Munkakönyvtárunk /app lesz
WORKDIR /app

# Másoljuk át a pom.xml-t a munkakönyvtárba
COPY . .

# Futtassuk a Maven-t a függőségek letöltéséhez
RUN ["mvn", "dependency:resolve"]

# Másoljuk át az alkalmazás forrását a munkakönyvtárba
COPY src ./src

# Készítsük el az alkalmazást
RUN ["mvn", "package"]

# Indítsuk el az alkalmazást a konténerben
CMD ["java", "-jar", "target/backend-app.jar"]
