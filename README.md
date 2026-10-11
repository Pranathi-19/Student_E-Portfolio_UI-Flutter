# 🎓 Student E-Portfolio Application

A Flutter-based **Student E-Portfolio Application** that presents a student's academic background, technical skills, course certifications, extracurricular activities, achievements, and projects in one organized interface.

Developed by **G. Pranathi** as a digital portfolio to make student information easy to access, review, and showcase.

## 👩‍💻 Student Information

| Detail | Information |
|---|---|
| **Name** | G. Pranathi |
| **Roll Number** | 24WH1A0584 |
| **College** | BVRIT Hyderabad College of Engineering for Women |
| **Degree** | B.Tech – Computer Science and Engineering |
| **Academic Period** | 2024–2028 |
| **CGPA** | 8.77 |
| **GitHub** | [Pranathi-19](https://github.com/Pranathi-19) |
| **LinkedIn** | [Guddenka Pranathi](https://linkedin.com/in/pranathi-guddenka-647340327) |

---

## 📌 Project Overview

Student information is often scattered across mark sheets, certificates, documents, and separate project links. Finding and reviewing these records individually can be time-consuming.

The Student E-Portfolio Application addresses this problem by bringing important academic and professional information into a single, easy-to-navigate application.

After logging in, users can navigate through five main sections using the bottom navigation bar.

### 🎯 Objectives

- Organize student information in one place.
- Make academic performance and technical skills easy to review.
- Showcase certifications, extracurricular activities, and achievements.
- Present projects with relevant repository and report links.
- Provide a simple and organized user interface.

---

## ✨ Features

### 🔐 1. Login Screen
- Provides a login interface with roll number and password fields.
- Acts as the entry point to the student portfolio.

### 🎓 2. Academic Details
Displays the student's education, academic performance, and technical skills.

**Education**

| Qualification | Institution | Result |
|---|---|---|
| B.Tech – CSE (2024–2028) | BVRIT Hyderabad College of Engineering for Women | CGPA: 8.77 |
| Intermediate – MPC | New Masterminds Junior College | 98% |
| SSC | Eminent Concept School | CGPA: 10.0 |

**Technical Skills**

- **Programming Languages:** Java, Python, C, C++ (basic), SQL
- **Tools:** Git, GitHub, Visual Studio Code, Tableau, Overleaf
- **Core Subjects:** Object-Oriented Programming (OOP), Database Management Systems (DBMS), Data Structures
- **Soft Skills:** Communication, problem-solving, teamwork

### 📜 3. Course Certifications
Organizes course and certification entries with their providers, completion years, and a View action.

Certifications showcased include:

- Being Zero Coding League 2.0 – 2026
- CodeChef Java
- CodeChef OOPs Through Java
- CodeChef C++
- CodeChef Data Structures
- Simplilearn Python for Beginners
- Simplilearn OOPs in Java
- Scaler Python Course for Beginners

The View action is intended to open the corresponding certificate.

### 🌟 4. Extracurricular Activities
Highlights participation in activities beyond academics, including:

- **Anokhee Mentorship Initiative:** Selected for the mentorship initiative by Amadeus Software Labs.
- **Flipkart GRiD 7.0:** Participation in a technology competition.
- **Google Big Code:** Participation in a coding event.
- **Technical Event Participation:** Showcases involvement in technical activities and events.

### 🏆 5. Achievements
Presents key accomplishments in a card-based slideshow.

- **2nd Place – Flag Quest:** Technical event at Synergia, BVRIT Hyderabad.
- **Infosys Springboard Internship 7.0:** Shortlisted for the internship.
- **Anokhee Mentorship:** Selected for the Amadeus Software Labs initiative.
- **500+ Coding Problems:** Solved across competitive programming platforms.

### 💻 6. Projects
Showcases projects with relevant repository or report links.

#### A. Workforce Insights Dashboard for Employee Skills and Analytics
A workforce analytics project focused on employee skills and workforce insights, showcased as a recent internship project with Infosys.

- **Focus:** Employee skills and analytics
- **Repository:** [View on GitHub](https://github.com/Pranathi-19/Creation-of-Workforce-Insights-Dashboard-for-Employee-Skills-and-Analytics)

#### B. IntegrityX – GitHub-Based Programming Assignment Evaluation System
A system designed around GitHub-based programming assignment evaluation.

- **Technologies:** HTML, CSS, JavaScript, PHP, MySQL, GitHub API
- **Focus:** Programming assignment evaluation and GitHub integration
- **Project documentation:** The project report is showcased through the portfolio application's View Project Report action.

#### C. Internet Memory Bank
An AI-powered personal knowledge management project designed to organize information and support semantic search.

- **Technologies:** Node.js, Express.js, MongoDB, OpenAI API, HTML, CSS, JavaScript
- **Focus:** Personal knowledge management and semantic search

---

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| **Flutter** | Building the application interface |
| **Dart** | Application logic and functionality |
| **Visual Studio Code** | Development environment |
| **Flutter Web / Chrome** | Running and testing the web version |
| **url_launcher** | Opening external links such as GitHub and project reports |
| **Local Assets** | Storing the profile image and certificate files |

---

## 🧭 Application Navigation

The application is organized into the following sections:

1. Login
2. Academic Details
3. Course Certifications
4. Extra-Curricular Activities
5. Achievements
6. Projects

Each section has its own page to keep the information organized and easy to find.

---

## ⚙️ Getting Started

Follow these steps to run the project locally.

### Prerequisites

Install the following tools:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) — included with Flutter
- [Visual Studio Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/)
- Google Chrome, if you want to run the Flutter web version

### 1. Clone the Repository

Replace `YOUR_USERNAME` and `YOUR_REPOSITORY` with the actual GitHub repository details.

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
```

### 2. Open the Project

```bash
cd YOUR_REPOSITORY
```

Make sure you are in the directory containing `pubspec.yaml`.

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run the Application

To run the web version in Chrome:

```bash
flutter run -d chrome
```

To check the Flutter setup:

```bash
flutter doctor
```

---

## 📁 Project Structure

The following is a typical Flutter project structure. Your actual folder and file names may differ.

```text
student_e_portfolio/
├── android/
├── ios/
├── web/
├── lib/
│   └── main.dart
├── assets/
│   ├── pranathi.jpg
│   └── certificates/
├── test/
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

- `lib/` – Flutter application source code.
- `lib/main.dart` – Main application entry point, if the app is organized in a single file.
- `assets/` – Profile image and local certificate files, if included.
- `web/` – Flutter web application files.
- `pubspec.yaml` – Project configuration, dependencies, and declared assets.
- `test/` – Application tests, if included.

**Note:** Keep the README structure aligned with the files actually present in your repository. Only list assets and folders that exist in your project.

---

## 🧪 Development Workflow

The application was developed using the following workflow:

1. **Identify:** Decide which student portfolio sections are required.
2. **Organize:** Collect and arrange academic and professional information.
3. **Build:** Create the user interface using Flutter widgets.
4. **Connect:** Add navigation, portfolio content, and relevant links.
5. **Run and Review:** Launch the application and check the output.

---

## 🚀 Future Enhancements

Potential improvements for future versions include:

- Add stronger authentication and input validation.
- Improve certificate viewing and document handling across web and mobile platforms.
- Add more interactive project previews.
- Make portfolio content configurable without changing the application source code.
- Expand the application with additional student records and portfolio sections.

---

## 👩‍💻 About Me

I am **G. Pranathi**, a Computer Science and Engineering student interested in programming, software development, data structures, and technology-driven problem-solving.

I enjoy building projects that combine practical functionality with clear user experiences and help me strengthen my technical skills.

- **GitHub:** [github.com/Pranathi-19](https://github.com/Pranathi-19)
- **LinkedIn:** [linkedin.com/in/pranathi-guddenka-647340327](https://linkedin.com/in/pranathi-guddenka-647340327)

---

## 🙏 Acknowledgement

This Student E-Portfolio Application was developed as a way to organize and present academic records, skills, certifications, activities, achievements, and project work in one place.

Thank you for visiting my repository!

**G. Pranathi**  
**Roll No.: 24WH1A0584**  
BVRIT Hyderabad College of Engineering for Women
