 # Deployment Diagram Sharing App

UML Specification Level Deployment Diagram of the **SharingApp** application.

The Diagram is in [diagram.pdf]().

## Steps

1. To access this remote database, the mobile/web app sends an HTTP request to the remote web server.
2. The web server parses the HTTP request to determine its type, then passes the data along to the application server.
3. The application server parses the request and depending on the request, it either fetches data from the database or modifies the database.

## Assumptions

1. The application stores its data in a remote database and that the app has both a mobile and web version.
2. The web server, application server and database all reside on the same device and all run in the same execution environment.
3. There are 3 separate JAR files which are used to manifest the web server, application server, and database components respectively. 
4. The web server component uses a config file to configure the server to route requests to the application server.
5. The application server component runs a JAR file to search and modify the database. 
6. The database component uses a XSD file to define its schema.
7. A HTML file manifests the sharing web app. 
8. An APK file manifests the sharing mobile app.