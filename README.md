## Overview

**NepalHikeHub** is an end-to-end trek management and booking platform designed to connect trekkers with curated hiking experiences across Nepal. The platform provides detailed trail information, difficulty assessments, real-time availability, and seamless booking capabilities.

Built on a robust three-tier architecture using Java servlets and JSP, the application ensures scalability, maintainability, and optimal performance for concurrent users.

---


## Technology Stack

### Backend
- **Language**: Java 17
- **Framework**: Jakarta Servlet 6.0 / JSP 3.1
- **Build Tool**: Maven 3.3.2
- **Architecture**: MVC (Model-View-Controller)

### Frontend
- **Markup**: HTML5
- **Styling**: CSS3
- **Client-Side Logic**: JavaScript (ES6+)

### Database
- **DBMS**: MySQL 8.0+
- **Connector**: MySQL Connector/J 8.1.0

### Build & Packaging
- **Output**: WAR (Web Archive)
- **Deployment**: Apache Tomcat 9.0+ / Jetty

---

## Prerequisites

Before setting up the project, ensure you have the following installed:

| Component | Version | Purpose |
|-----------|---------|---------|
| Java JDK | 17+ | Compilation and runtime |
| Maven | 3.6+ | Dependency management and build automation |
| MySQL Server | 8.0+ | Database management |
| Apache Tomcat | 9.0+ | Application server |
| Eclipse IDE | 2023+ | (Optional) Development environment |
| Git | 2.0+ | Version control |

**Verification Commands:**
```bash
java -version
mvn -version
mysql --version

NepalHikeHub/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/nepalhikehub/
│   │   │       ├── servlet/          # HTTP Request Handlers
│   │   │       ├── service/          # Business Logic
│   │   │       ├── dao/              # Data Access Objects
│   │   │       ├── model/            # Entity Classes
│   │   │       ├── util/             # Utility Classes
│   │   │       └── config/           # Configuration Classes
│   │   ├── webapp/
│   │   │   ├── WEB-INF/
│   │   │   │   ├── web.xml           # Deployment Descriptor
│   │   │   │   └── lib/              # Dependencies
│   │   │   ├── jsp/                  # JSP Pages
│   │   │   ├── html/                 # Static HTML
│   │   │   ├── css/                  # Stylesheets
│   │   │   ├── js/                   # JavaScript
│   │   │   └── images/               # Image Assets
│   │   └── resources/
│   │       └── db.properties          # Database Config
│   └── test/                          # Unit Tests
├── sql/
│   ├── schema.sql                     # Database Schema
│   ├── initial_data.sql               # Seed Data
│   └── procedures.sql                 # Stored Procedures
├── .gitignore                         # Git Ignore Rules
├── .classpath                         # Eclipse Classpath
├── .project                           # Eclipse Project
├── pom.xml                            # Maven Configuration
└── README.md                          # This File

<!-- Jakarta Servlet API -->
<dependency>
    <groupId>jakarta.servlet</groupId>
    <artifactId>jakarta.servlet-api</artifactId>
    <version>6.0.0</version>
    <scope>provided</scope>
</dependency>

<!-- Jakarta JSP API -->
<dependency>
    <groupId>jakarta.servlet.jsp</groupId>
    <artifactId>jakarta.servlet.jsp-api</artifactId>
    <version>3.1.1</version>
    <scope>provided</scope>
</dependency>

<!-- JSTL Support -->
<dependency>
    <groupId>jakarta.servlet.jsp.jstl</groupId>
    <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
    <version>3.0.0</version>
</dependency>

<!-- MySQL Connector -->
<dependency>
    <groupId>com.mysql</groupId>
    <artifactId>mysql-connector-j</artifactId>
    <version>8.1.0</version>
</dependency>




<properties>
    <maven.compiler.source>17</maven.compiler.source>
    <maven.compiler.target>17</maven.compiler.target>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
</properties>

Building & Deployment
Development Build
bash
# Clean previous builds
mvn clean

# Compile source code
mvn compile

# Run locally on Tomcat
mvn tomcat7:run

icense
This project is licensed under the MIT License - see the LICENSE file for details.

Contact & Support
Project Lead: Surendra Bhujel
GitHub: @Surendra-Bhujel
Email: magarsurendra81@gmail.com

For issues, questions, or suggestions:

📋 Open an Issue
💬 Start a Discussion
📧 Contact via email
