Online Book Store (Book Lab)
A web-based bookstore application built with Java EE, JSP, and MySQL.

* Features
User Authentication & Authorization
Book Management (Add, Edit, Delete)
Shopping Cart Functionality
Order Processing
User Profile Management
Admin Dashboard
Responsive UI with Tailwind CSS


* Tech Stack

Backend: Java EE, Servlets, JSP
Frontend: HTML, CSS (Tailwind), JavaScript
Database: MySQL 8.0
Build Tool: Maven
Server: Apache Tomcat
Additional Libraries: JSTL 1.2

* Project Structure

book-lab/
├── src/main/
│   ├── java/
│   │   ├── com.admin.servlet/    # Admin related servlets
│   │   ├── com.dao/              # Data Access Objects
│   │   ├── com.db/               # Database configuration
│   │   ├── com.entity/           # Entity classes
│   │   └── com.user.servlet/     # User related servlets
│   └── webapp/
│       ├── admin/                # Admin pages
│       ├── components/           # Reusable JSP components
│       ├── books/               # Book images storage
│       └── WEB-INF/
├── pom.xml                      # Maven configuration
└── README.md




* Setup Instructions
Clone the repository
Import as Maven project in Eclipse/IntelliJ
Configure MySQL database
Update database credentials in DBConnection.java
Deploy on Tomcat server
Access application at http://localhost:8080/online-book-store

*Database Configuration
The application requires MySQL 8.0. Configure your database connection in DBConnection.java:

String url = "jdbc:mysql://localhost:3306/bookstore";
String username = "your_username";
String password = "your_password";


*Dependencies
Java Servlet API 4.0.1
MySQL Connector 8.0.33
JSTL 1.2


