
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const StudentPortfolioApp());
}

const Color navy = Color(0xFF273469);
const Color paleBlue = Color(0xFFE9ECF8);

const String githubUrl = 'https://github.com/Pranathi-19';
const String linkedinUrl =
    'https://linkedin.com/in/pranathi-guddenka-647340327';

class StudentPortfolioApp extends StatelessWidget {
  const StudentPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student E-Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: navy),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: navy,
          foregroundColor: Colors.white,
        ),
      ),
      home: const LoginPage(),
    );
  }
}


Future<void> openLink(
  BuildContext context,
  String url, {
  String label = 'link',
}) async {
  if (url.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please add your $label URL in main.dart.')),
    );
    return;
  }

  Uri? uri;

  // Open files bundled in the Flutter assets folder (Chrome/web).
  if (url.startsWith('assets/')) {
    uri = Uri.base.resolve(url);
  } else {
    uri = Uri.tryParse(url);
  }

  if (uri == null ||
      uri.host.isEmpty ||
      (uri.scheme != 'https' &&
          uri.scheme != 'http')) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('The $label URL is invalid.')),
    );
    return;
  }

  try {
    final opened = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open $label.')),
      );
    }
  } catch (_) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open $label.')),
      );
    }
  }
}


// Replace assets/pranathi.jpg with your own photo.
class StudentAvatar extends StatelessWidget {
  final double radius;
  const StudentAvatar({super.key, this.radius = 45});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: navy,
      child: ClipOval(
        child: Image.asset(
          'assets/pranathi.jpg',
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Icon(
            Icons.person,
            size: radius * 1.2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// PAGE 1: LOGIN
// Demo login only; it does not authenticate against a real account.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final rollController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidePassword = true;

  void login() {
    if (rollController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your roll number and password.'),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => DashboardPage(
          rollNumber: rollController.text.trim(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    rollController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [paleBlue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(26),
                    child: Column(
                      children: [
                        const StudentAvatar(radius: 56),
                        const SizedBox(height: 18),
                        const Icon(Icons.school, size: 38, color: navy),
                        const SizedBox(height: 8),
                        const Text(
                          'My Portfolio',
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: navy,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Guddenka Pranathi',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Student E-Portfolio App',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 25),
                        TextField(
                          controller: rollController,
                          decoration: const InputDecoration(
                            labelText: 'Roll Number',
                            prefixIcon: Icon(Icons.badge_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: passwordController,
                          obscureText: hidePassword,
                          onSubmitted: (_) => login(),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () => setState(
                                () => hidePassword = !hidePassword,
                              ),
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: FilledButton.icon(
                            onPressed: login,
                            icon: const Icon(Icons.login),
                            label: const Text('Login'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'BVRIT Hyderabad College of Engineering for Women',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// PAGE 2: DASHBOARD WITH FIVE TABS
class DashboardPage extends StatefulWidget {
  final String rollNumber;

  const DashboardPage({super.key, required this.rollNumber});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  final titles = const [
    'Academic Details',
    'Course Certifications',
    'Extra-Curricular Activities',
    'Achievements',
    'Projects',
  ];

  final icons = const [
    Icons.school_outlined,
    Icons.card_membership_outlined,
    Icons.groups_outlined,
    Icons.emoji_events_outlined,
    Icons.folder_outlined,
  ];

  void logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const AcademicPage(),
      const CertificationsPage(),
      const ActivitiesPage(),
      const AchievementsPage(),
      const ProjectsPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[selectedIndex]),
        actions: [
          IconButton(
            onPressed: logout,
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: paleBlue,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            child: Row(
              children: [
                const StudentAvatar(radius: 23),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Guddenka Pranathi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'B.Tech Computer Science and Engineering',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'GitHub',
                  onPressed: () => openLink(
                    context,
                    githubUrl,
                    label: 'GitHub profile',
                  ),
                  icon: const Icon(Icons.code),
                ),
                IconButton(
                  tooltip: 'LinkedIn',
                  onPressed: () => openLink(
                    context,
                    linkedinUrl,
                    label: 'LinkedIn profile',
                  ),
                  icon: const Icon(Icons.work_outline),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: pages,
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            label: 'Academics',
          ),
          NavigationDestination(
            icon: Icon(Icons.card_membership_outlined),
            label: 'Certificates',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            label: 'Activities',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events_outlined),
            label: 'Achievements',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_outlined),
            label: 'Projects',
          ),
        ],
      ),
    );
  }
}

// 1. ACADEMIC DETAILS
class AcademicPage extends StatelessWidget {
  const AcademicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionHeading(
          title: 'Academic Details',
          subtitle: 'Education history and academic performance',
        ),
        Card(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Course')),
                DataColumn(label: Text('Institution')),
                DataColumn(label: Text('Year')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('B.Tech CSE')),
                  DataCell(Text(
                    'BVRIT Hyderabad College of Engineering for Women',
                  )),
                  DataCell(Text('2024–2028')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Intermediate MPC')),
                  DataCell(Text('New Masterminds Junior College')),
                  DataCell(Text('2022–2024')),
                ]),
                DataRow(cells: [
                  DataCell(Text('SSC')),
                  DataCell(Text('Eminent Concept School')),
                  DataCell(Text('2021–2022')),
                ]),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const InfoCard(
          title: 'Academic Performance',
          icon: Icons.auto_graph,
          children: [
            MetricRow(label: 'B.Tech CGPA', value: '8.77'),
            MetricRow(label: 'Intermediate MPC', value: '98%'),
            MetricRow(label: 'SSC CGPA', value: '10.0'),
          ],
        ),
        const SizedBox(height: 16),
        const InfoCard(
          title: 'Technical Skills',
          icon: Icons.code,
          children: [
            Text('Languages: Java, Python, C, C++ (Basics), SQL'),
            SizedBox(height: 8),
            Text('Tools: Git, GitHub, VS Code, Tableau, Overleaf'),
            SizedBox(height: 8),
            Text('Coursework: OOP, DBMS, Data Structures'),
            SizedBox(height: 8),
            Text('Soft Skills: Communication, Problem Solving, Teamwork'),
          ],
        ),
      ],
    );
  }
}

// 2. COURSE CERTIFICATIONS
// Add each actual certificate URL in the url field.
const List<Map<String, String>> certificates = [
  {
    'name': 'Coding League 2.0 Participation Certificate',
    'platform': 'Being Zero',
    'year': '2026',
    'url': 'assets/BZCL.pdf',
  },
  {
    'name': 'OOPs Through Java',
    'platform': 'CodeChef',
    'year': '2025',
    'url': 'assets/OOPS_Codechef.jpeg',
  },
  {
    'name': 'Java',
    'platform': 'CodeChef',
    'year': '2025',
    'url': 'assets/Java_Codechef.pdf',
  },
  {
    'name': 'C++',
    'platform': 'CodeChef',
    'year': '2025',
    'url': 'assets/C++.pdf',
  },
  {
    'name': 'Python for Beginners',
    'platform': 'Simplilearn',
    'year': '2025',
    'url': 'assets/Python_Simplilearn.pdf',
  },
  {
    'name': 'OOPs in Java',
    'platform': 'Simplilearn',
    'year': '2025',
    'url': 'assets/OOPs_in_Java_Simplilearn.pdf',
  },
  {
    'name': 'Python Course for Beginners',
    'platform': 'Scaler',
    'year': '2025',
    'url': 'assets/Python_Scaler.jpeg',
  },
];


class CertificationsPage extends StatelessWidget {
  const CertificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionHeading(
          title: 'Course Certifications',
          subtitle: 'Courses completed and certificates earned',
        ),
        ...certificates.map((certificate) {
          return Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: paleBlue,
                child: Icon(
                  Icons.workspace_premium,
                  color: navy,
                ),
              ),
              title: Text(
                certificate['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                '${certificate['platform']} • ${certificate['year']}',
              ),
              
trailing: TextButton(
  onPressed: () {
    final url = certificate['url'] ?? '';
    openLink(context, url, label: 'certificate');
  },
  child: const Text('View'),
),

            ),
          );
        }),
      ],
    );
  }
}


// 3. EXTRA-CURRICULAR ACTIVITIES

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  static const activities = [
    {
      'name': 'Anokhee Mentorship Initiative',
      'detail':
          'Selected to participate in the mentorship initiative by Amadeus Software Labs.',
      'icon': Icons.groups_outlined,
    },
    {
      'name': 'Flipkart GRiD 7.0',
      'detail':
          'Participated in a national-level engineering and technology challenge.',
      'icon': Icons.lightbulb_outline,
    },
    {
      'name': 'Google Big Code',
      'detail':
          'Participated in software development and coding challenges.',
      'icon': Icons.code,
    },
    {
      'name': 'Technical Event Participation',
      'detail':
          'Engaged in technical events and collaborative activities at college.',
      'icon': Icons.event_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionHeading(
          title: 'Activities & Leadership',
          subtitle:
              'Mentorship, technical participation and collaborative experiences',
        ),
        ...activities.map((activity) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: paleBlue,
                child: Icon(
                  activity['icon'] as IconData,
                  color: navy,
                ),
              ),
              title: Text(activity['name'] as String),
              subtitle: Text(activity['detail'] as String),
            ),
          );
        }),
      ],
    );
  }
}


// 4. AUTOMATIC ACHIEVEMENTS SLIDESHOW
class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  final PageController controller = PageController();
  int currentPage = 0;
  Timer? timer;

  final achievements = const [
    {
      'title': 'Flag Quest — 2nd Place',
      'description': 'Technical event at Synergia, BVRIT Hyderabad.',
      'icon': Icons.emoji_events,
      'color': Color(0xFF273469),
    },
    {
      'title': 'Infosys Springboard Internship 7.0',
      'description': 'Shortlisted for the internship.',
      'icon': Icons.workspace_premium,
      'color': Color(0xFF19766B),
    },
    {
      'title': 'Anokhee Mentorship',
      'description': 'Selected for the Amadeus Software Labs initiative.',
      'icon': Icons.school,
      'color': Color(0xFF51428A),
    },
    {
      'title': '500+ Coding Problems',
      'description': 'Solved across competitive programming platforms.',
      'icon': Icons.code,
      'color': Color(0xFF9A5A16),
    },
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted || !controller.hasClients) return;
      final next = (currentPage + 1) % achievements.length;
      controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 18, 16, 0),
          child: SectionHeading(
            title: 'Achievements',
            subtitle: 'Highlights from my academic and technical journey',
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: controller,
            itemCount: achievements.length,
            onPageChanged: (index) => setState(() => currentPage = index),
            itemBuilder: (context, index) {
              final item = achievements[index];
              return Container(
                margin: const EdgeInsets.all(22),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: item['color'] as Color,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      size: 78,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      item['title'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item['description'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Text('${currentPage + 1} / ${achievements.length}'),
        const SizedBox(height: 16),
      ],
    );
  }
}

// 5. PROJECTS
// Replace empty URL values with your actual GitHub repository links.

const List<Map<String, String>> projects = [
  {
    'title': 'Workforce Insights Dashboard for Employee Skills and Analytics',
    'date': '2026',
    'description':
        'An employee skills and workforce analytics dashboard developed as part of the Infosys internship. Explore workforce information and skills-related insights through a centralized dashboard.',
    'technologies': 'See GitHub repository',
    'url':
        'https://github.com/Pranathi-19/Creation-of-Workforce-Insights-Dashboard-for-Employee-Skills-and-Analytics',
    'buttonText': 'View on GitHub',
  },
  {
    'title': 'IntegrityX — Automated Assignment Evaluation',
    'date': '2026',
    'description':
        'A GitHub-based assignment evaluation system that uses webhook-triggered workflows, automated test-case execution, and student and faculty dashboards.',
    'technologies': 'HTML, CSS, JavaScript, PHP, MySQL, GitHub API',
    'url': 'assets/IntegrityX.pdf',
    'buttonText': 'View Project Report',
  },
  {
    'title': 'Internet Memory Bank',
    'date': '2026',
    'description':
        'An AI-powered personal knowledge management application designed to organize information and support semantic search.',
    'technologies':
        'Node.js, Express.js, MongoDB, OpenAI API, HTML, CSS, JavaScript',
    'url': '',
    'buttonText': '',
  },
];



class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionHeading(
          title: 'My Projects',
          subtitle: 'Selected software projects from my resume',
        ),
        ...projects.map((project) {
          final url = project['url'] ?? '';

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundColor: paleBlue,
                        child: Icon(Icons.folder_outlined, color: navy),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          project['title'] ?? 'Untitled Project',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(project['date'] ?? ''),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(project['description'] ?? ''),
                  const SizedBox(height: 10),
                  Text(
                    'Tech Stack: ${project['technologies'] ?? 'Not specified'}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                  if (url.trim().isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: OutlinedButton.icon(
                        onPressed: () => openLink(
                          context,
                          url,
                          label: 'project',
                        ),
                        icon: const Icon(Icons.open_in_new),
                        label: Text(
                          project['buttonText'] ?? 'View Project',
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}


// REUSABLE WIDGETS
class SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const InfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: navy),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

class MetricRow extends StatelessWidget {
  final String label;
  final String value;

  const MetricRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
