import 'package:flutter/material.dart';
import 'package:appceloe/models/course.dart';
import 'package:appceloe/utils/theme.dart';
import 'package:appceloe/widgets/upcoming_assignment_card.dart';
import 'package:appceloe/widgets/announcement_banner.dart';
import 'package:appceloe/widgets/course_progress_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Static data for demonstration
  final List<Course> courses = [
    Course(name: 'Desain Tampilan & Pengalaman Pengguna (UI/UX)', progress: 1.0), // Completed?
    Course(name: 'Kewarganegaraan', progress: 0.8),
    Course(name: 'Sistem Operasi', progress: 0.6),
    Course(name: 'Pemrograman Perangkat Bergerak Multimedia', progress: 0.4),
    Course(name: 'Bahasa Inggris: Bisnis dan Ilmiah', progress: 0.2),
    Course(name: 'Pemrograman Multimedia Interaktif', progress: 0.1),
    Course(name: 'Olah Raga', progress: 0.0),
  ];

  final Assignment upcomingAssignment = Assignment(
    title: 'Tugas 01 - UID Android Mobile Game',
    courseName: 'Pemrograman Perangkat Bergerak Multimedia',
    deadline: '10:59 PM',
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: CeloeTheme.primaryColor,
              child: Text('D', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Dandy Candra Pratama',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Mahasiswa',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            UpcomingAssignmentCard(assignment: upcomingAssignment),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Pengumuman Terakhir',
                 style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const AnnouncementBanner(title: 'Info Maintenance Server'),
             const SizedBox(height: 20),
             const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Progres Kelas',
                 style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true, // Important for nesting in SingleChildScrollView
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return CourseProgressItem(course: courses[index]);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: CeloeTheme.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
