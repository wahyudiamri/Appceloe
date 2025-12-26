import 'package:flutter/material.dart';
import 'package:appceloe/models/course.dart';
import 'package:appceloe/utils/theme.dart';
import 'package:appceloe/widgets/upcoming_assignment_card.dart';
import 'package:appceloe/widgets/announcement_banner.dart';
import 'package:appceloe/widgets/course_progress_item.dart';
import 'package:appceloe/screens/my_classes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Updated static data with new fields
  final List<Course> courses = [
    Course(
      name: 'Bahasa Inggris: Business dan Scientific',
      code: 'D4SM-41-GABI',
      semester: '2021/2',
      lecturers: '[ARS]',
      progress: 0.2
    ),
    Course(
      name: 'Desain Antarmuka & Pengalaman Pengguna',
      code: 'D4SM-42-03',
      semester: '2021/2',
      lecturers: '[ADY]',
      progress: 1.0
    ),
    Course(
      name: 'Kewarganegaraan',
      code: 'D4SM-41-GABI',
      semester: '2021/2',
      lecturers: '[BBO], Jumat 2',
      progress: 0.8
    ),
    Course(
      name: 'Olah Raga',
      code: 'D3TT-44-02',
      semester: '2021/2',
      lecturers: '[EYR]',
      progress: 0.0
    ),
    Course(
      name: 'Pemrograman Multimedia Interaktif',
      code: 'D4SM-43-04',
      semester: '2021/2',
      lecturers: '[TPR]',
      progress: 0.1
    ),
    Course(
      name: 'Pemrograman Perangkat Bergerak Multimedia',
      code: 'D4SM-41-GABI',
      semester: '2021/2',
      lecturers: '[APJ]',
      progress: 0.4
    ),
    Course(
      name: 'Sistem Operasi',
      code: 'D4SM-44-02',
      semester: '2021/2',
      lecturers: '[DDS]',
      progress: 0.6
    ),
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
    // Define the content for each tab
    final List<Widget> _widgetOptions = <Widget>[
      // Tab 0: Home Content
      SingleChildScrollView(
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
              itemCount: courses.length > 5 ? 5 : courses.length, // Show limited items on Home
              itemBuilder: (context, index) {
                return CourseProgressItem(course: courses[index]);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // Tab 1: My Classes Content
      MyClassesScreen(courses: courses),
      // Tab 2: Notifications (Placeholder)
      const Center(child: Text('Notifikasi Screen Placeholder')),
    ];

    // Dynamic Title based on selection
    Widget _appBarTitle;
    if (_selectedIndex == 0) {
      _appBarTitle = Row(
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
        );
    } else if (_selectedIndex == 1) {
      _appBarTitle = const Text(
          'Kelas Saya',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        );
    } else {
      _appBarTitle = const Text('Notifikasi');
    }


    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
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

