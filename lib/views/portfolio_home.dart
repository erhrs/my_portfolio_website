import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../widgets/contact_info_row.dart';
import '../widgets/download_btn.dart';
import '../widgets/glass_card.dart';
import '../widgets/nav_bar.dart';
import '../widgets/project_card.dart';
import '../widgets/theme_controller.dart';
import 'dart:html' as html;

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final themeController = Get.find<ThemeController>();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() => SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            NavBar(
              selectedIndex: selectedIndex,
              onItemSelected: (index) {
                setState(() => selectedIndex = index);
              },
              isDarkMode: themeController.isDarkMode.value,
              onToggleTheme: themeController.toggleTheme,
            ),
            const Divider(height: 1),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: _getPage(selectedIndex),
              ),
            ),
          ],
        ),
      ),
    ));
  }
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return homePage(context);
      case 1:
        return projectPage();
      case 2:
        return contact(context);
      default:
        return const SizedBox.shrink();
    }
  }
}

Widget homePage(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors:[Color(0xFF6A11CB), Color(0xFF2575FC)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: GlassCard(
                child: buildHomeContent(context),
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
            ),
            const SizedBox(height: 32),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Me',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'I’m Harsh Yadav — a Flutter developer with 2.5+ years of experience. I craft scalable mobile/web apps using Flutter, Firebase, and GetX. I\'m also comfortable working with Java, JavaScript, Node.js, and SQL, and can quickly gain command over these technologies to contribute across the stack.',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      '💼 Featured Projects',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    _buildProjectList(),

                    const SizedBox(height: 24),
                    const Text(
                      '🎓 Education',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Bachelor of Engineering\n2016 - 2020\nOriental Institute of Science and Technology, Bhopal',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 700.ms, delay: 200.ms).slideY(begin: 0.2),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget projectPage() {
  return Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFFF5F6D), Color(0xFFFFC371)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: const SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          runSpacing: 20,
          children: [
            ProjectCard(
              title: 'Ball Escape Game',
              description:
              'A geometric arcade-style game developed using Flutter and Flame engine. The player launches a ball trapped inside a triangular barrier, where it bounces off the walls. Each barrier breaks after a set number of hits, eventually allowing the ball to escape. Includes angled barrier collision, smooth sprite animation, collision tracking, and manual barrier control through directional buttons for strategic gameplay.',
              screenshots: [
                'assets/images/plinko (2).png',
                'assets/images/plinko (3).png',
                'assets/images/plinko (4).png',
                'assets/images/plinko (5).png',
                'assets/images/plinko (6).png',
                'assets/images/plinko (1).png',
              ],
            ),
            ProjectCard(
              title: 'Sanatan Dharma App',
              playStoreUrl: 'https://play.google.com/store/apps/details?id=com.hhm.mantras',
              description: 'A beautifully crafted spiritual app dedicated to Sanatan Dharma. Explore daily mantras, aartis, and powerful strotams, all in one place. Features include mantra chanting count tracking, live aarti streaming, and a Hindu calendar with festival alerts. Ideal for users of all ages seeking a devotional companion rooted in tradition and convenience.',
              screenshots: [
                'assets/images/sanatan (2).png',
                'assets/images/sanatan (1).png',
                'assets/images/sanatan (3).png',
                'assets/images/sanatan (4).png',
                'assets/images/sanatan (5).png',
              ],
            ),
            ProjectCard(
              title: '2nd-Hand Sports Marketplace',
              description:
              'A community-driven marketplace app built with Flutter, GetX, and Firebase Realtime Database, enabling users to buy and sell second-hand sports equipment locally. Features include product listings, chat with sellers, event creation and participation, blocking/reporting users or content, and location-aware browsing—all delivered through a sleek and responsive interface.',
              screenshots: [
                'assets/images/marketplace (4).png',
                'assets/images/marketplace (1).png',
                'assets/images/marketplace (5).png',
                'assets/images/marketplace (6).png',
                'assets/images/marketplace (7).png',
                'assets/images/marketplace (8).png',
                'assets/images/marketplace (2).png',
                'assets/images/marketplace (3).png',
              ],
            ),

            ProjectCard(
              title: 'Aviator Game',
              description: 'A thrilling single-player game built using Flutter and Flame, inspired by the popular Aviator crash game. Watch the plane soar and tap out before it crashes to secure your winnings. Built with Firebase Realtime Database for dynamic session tracking, this game blends sharp reflexes with strategic timing—all packed into a clean and fast UI.',
              screenshots: [
                'assets/images/aviator (3).png',
                'assets/images/aviator (4).png',
                'assets/images/aviator (5).png',
                'assets/images/aviator (2).png',
                'assets/images/aviator (1).png',
              ],
            ),

            ProjectCard(
              title: 'Nway HRM App',
              description:
              'A robust employee management system designed using Flutter, focused on streamlining HR operations for modern organizations. Nway HRM enables employees to mark attendance with GPS tagging, view/download pay slips, and request leave or attendance corrections—all through a user-friendly interface. Managers can efficiently review and approve applications within the app. This app empowers companies to align workforce performance with strategic goals.',
              screenshots: [
                'assets/images/hrm2.png',
                'assets/images/hrm3.png',
                'assets/images/hrm4.png',
                'assets/images/hrm5.png',
                'assets/images/hrm1.png',
              ],
              playStoreUrl: 'https://play.google.com/store/apps/details?id=com.nway.hrm.ios',
            ),

            ProjectCard(
              title: 'Nway TMS App',
              description:
              'A comprehensive Transport Management System (TMS) app developed using Flutter to streamline logistics and transport operations. Designed for freight, logistics, and warehousing companies, this app consolidates critical business processes into a single intuitive dashboard. Core features include Builty creation and approval, POD management, driver and vehicle document validation, and multi-stage trip log approvals. With support for full and partial load workflows, invoicing (Proforma & Main), and transport account verifications, Nway TMS helps increase operational efficiency and ensure compliance across the transport domain.',
              screenshots: [
                'assets/images/tms1.png',
                'assets/images/tms2.png',
                'assets/images/tms3.png',
                'assets/images/tms4.png',
              ],
              playStoreUrl: 'https://play.google.com/store/apps/details?id=com.nway.transport',
            ),

            ProjectCard(
              title: 'Pet Adoption & Shelter Management',
              description:
              'A compassionate Flutter app powered by GetX and Firebase Realtime Database, designed to streamline pet shelter operations and connect potential adopters with animals in need. Key features include pet listing with images and health notes, adoption request management, task scheduling with reminders, and staff assignments—making pet care and adoption both efficient and heartwarming.',
              screenshots: [
                'assets/images/petmanagement (1).png',
                'assets/images/petmanagement (2).png',
                'assets/images/petmanagement (3).png',
                'assets/images/petmanagement (4).png',
                'assets/images/petmanagement (5).png',
                'assets/images/petmanagement (6).png',
                'assets/images/petmanagement (7).png',
              ],
            ),

            ProjectCard(
              title: 'Cricscore',
              description:
              'A real-time cricket score tracking app developed using Flutter and RESTful APIs. Cricscore offers live match updates, upcoming match schedules, team and player details, and match filtering based on date and status. With a clean UI and efficient API handling, users can stay informed about cricket matches worldwide at their fingertips.',
              screenshots: [
                'assets/images/cricscore (1).png',
                'assets/images/cricscore (2).png',
                'assets/images/cricscore (3).png',
                'assets/images/cricscore (4).png',
                'assets/images/cricscore (5).png',
                'assets/images/cricscore (6).png',
                'assets/images/cricscore (7).png',
              ],
            ),

            ProjectCard(
              title: 'Hostel Management App',
              description: 'Take the hassle out of hostel operations with this all-in-one management app. Easily track tenants, monitor rents, manage staff roles, and handle parking and rooms—all from your phone. A smooth onboarding flow highlights key features like real-time room tracking and simplified staff assignments. Designed for hostel owners seeking organized, stress-free management.',
              screenshots: [
                'assets/images/hostel_management (2).png',
                'assets/images/hostel_management (3).png',
                'assets/images/hostel_management (1).png',
                'assets/images/hostel_management (4).png',
                'assets/images/hostel_management (5).png',
              ],
            ),

          ],
        ),
      ),
    ),
  );
}

Widget contact(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF1A2980), Color(0xFF26D0CE)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: GlassCard(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 600;
                    return isMobile
                        ? _buildVerticalContact(context)
                        : _buildHorizontalContact(context);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildHorizontalContact(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: _contactDetails(context)),
      const SizedBox(width: 32),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Let\'s Work Together!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Text(
              'Feel free to reach out via email or phone. You can also connect with me on GitHub and LinkedIn.',
              style: TextStyle(color: Colors.white70),
            ),
            // const SizedBox(height: 24),
            // ElevatedButton.icon(
            //   onPressed: () {
            //     html.window.open('mailto:harsh2709.yadav@gmail.com', '_self');
            //   },
            //   icon: const Icon(Icons.email),
            //   label: const Text('Send Email'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.white24,
            //     foregroundColor: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildVerticalContact(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _contactDetails(context),
      const SizedBox(height: 32),
      Text(
        'Let\'s Work Together!',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
      ),
      const SizedBox(height: 12),
      const Text(
        'Feel free to reach out via email or phone. You can also connect with me on GitHub and LinkedIn.',
        style: TextStyle(color: Colors.white),
      ),
      // const SizedBox(height: 24),
      // ElevatedButton.icon(
      //   onPressed: () {
      //     html.window.open('mailto:harsh2709.yadav@gmail.com', '_self');
      //   },
      //   icon: const Icon(Icons.email),
      //   label: const Text('Send Email'),
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: Colors.white24,
      //     foregroundColor: Colors.white,
      //   ),
      // ),
    ],
  );
}

Widget _contactDetails(BuildContext context) {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ContactInfoRow(icon: Icons.email, label: 'Email', value: 'harsh2709.yadav@gmail.com'),
      SizedBox(height: 12),
      ContactInfoRow(icon: Icons.phone, label: 'Phone', value: '+91 9893399449'),
      SizedBox(height: 12),
      ContactInfoRow(icon: Icons.link, label: 'GitHub', value: 'https://github.com/erhrs'),
      SizedBox(height: 12),
      ContactInfoRow(icon: Icons.link, label: 'LinkedIn', value: 'https://linkedin.com/in/harsh-yadav-274854a0'),
    ],
  );
}

Widget buildHomeContent(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;
      return isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildHomeContent(context, isMobile),
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildHomeContent(context, isMobile),
      );
    },
  );
}

List<Widget> _buildHomeContent(BuildContext context, bool isMobile) {
  final profileImage = ClipRRect(
    borderRadius: BorderRadius.circular(100),
    child: Image.asset(
      'assets/images/profile_bg.png',
      width: 120,
      height: 120,
      fit: BoxFit.cover,
    ),
  );
  final content = Column(
    crossAxisAlignment:
    isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
    children: [
      Text(
        '👋 Hi, I\'m Harsh Yadav',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 12),
      Text(
        'A passionate Flutter developer who crafts beautiful, functional mobile & web experiences.',
        style:
        Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70),
        textAlign: isMobile ? TextAlign.center : TextAlign.start,
      ),
      const SizedBox(height: 24),
       Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: [
          customChip(label: 'Flutter', img: 'assets/icons/flutter.png'),
          customChip(label: 'Firebase', img: 'assets/icons/firebase.png'),
          customChip(label: 'GetX', img: 'assets/icons/getx.png'),
          customChip(label: 'Flame', img: 'assets/icons/flame.png'),
          customChip(label: 'Android', img: 'assets/icons/android.png'),
          customChip(label: 'Ios', img: 'assets/icons/apple.png'),
        ],
      ),
      const SizedBox(height: 24),
      const Text(
        '💡 Comfortable With',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      const SizedBox(height: 8),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: [
          customChip(label: 'Java', img: 'assets/icons/java.png'),
          customChip(label: 'JavaScript', img: 'assets/icons/js.png'),
          customChip(label: 'Node.js', img: 'assets/icons/nodejs.png'),
          customChip(label: 'SQL', img: 'assets/icons/sql.png'),
        ],
      ),
      const SizedBox(height: 24),
      // const DownloadResumeButton()
    ],
  );

  if (isMobile) {
    return [
      profileImage,
      const SizedBox(height: 24),
      content, // ⛔️ No Expanded in Column!
    ];
  } else {
    return [
      profileImage,
      const SizedBox(width: 24),
      Expanded(child: content), // ✅ Safe to use Expanded inside Row
    ];
  }
}

Widget _buildProjectList() {
  final projects = [
    '• Nway HRMS – HR app with GPS Attendance, payslips, leave system, employee management',
    '• Hostel Management – Manage hostels, tenants, rooms, payments and parking',
    '• Nway TMS – Transport Management app with fleet, billing, POD',
    '• Sanatan Dharma App – Aartis, mantras, live darshan, hindu calendar, Jaap counter',
    '• Games – Plinko, Aviator, Bingo multiplayer',
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: projects
        .map((p) => Text(p, style: const TextStyle(color: Colors.white70)))
        .toList(),
  );
}

Widget customChip({required String label, required String img}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(img,width: 20,height: 20,),
        const SizedBox(width: 5,),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),
        ),
      ],
    ),
  );
}

