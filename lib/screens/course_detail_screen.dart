import 'package:flutter/material.dart';
import 'package:appceloe/models/course.dart';
import 'package:appceloe/models/course_material.dart';
import 'package:appceloe/utils/theme.dart';
import 'package:appceloe/widgets/material_item_card.dart';
import 'package:appceloe/models/course_assignment.dart';
import 'package:appceloe/widgets/assignment_item_card.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    // Static data for materials based on screenshot
    final List<CourseMaterial> materials = [
      CourseMaterial(
        title: 'Modul 01 - Pengenalan',
        typeDisplay: 'PDF',
        size: '1.2 MB',
        type: CourseMaterialType.pdf,
      ),
      CourseMaterial(
        title: 'Video - Implementasi UI',
        typeDisplay: 'Video',
        size: '120 MB',
        type: CourseMaterialType.video,
      ),
      CourseMaterial(
        title: 'Slide - Minggu 02',
        typeDisplay: 'PPT',
        size: '4.6 MB',
        type: CourseMaterialType.ppt,
      ),
      // Adding more to show scrolling if needed
    ];

    // Static data for assignments
    final List<CourseAssignment> assignments = [
      CourseAssignment(
        title: 'Kuis Minggu 1',
        description: 'Kuis pilihan ganda tentang dasar UI/UX',
        deadline: 'Besok, 23:59',
        type: AssignmentType.quiz,
        status: AssignmentStatus.open,
      ),
      CourseAssignment(
        title: 'Tugas - Analisa Aplikasi',
        description: 'Buat laporan analisa UI/UX aplikasi favoritmu',
        deadline: 'Jumat, 23:59',
        type: AssignmentType.assignment,
        status: AssignmentStatus.submitted,
      ),
      CourseAssignment(
        title: 'Tugas - Wireframe',
        description: 'Buat wireframe lo-fi untuk 3 screen utama',
        deadline: 'Minggu depan',
        type: AssignmentType.assignment,
        status: AssignmentStatus.open,
      ),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            course.name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
             overflow: TextOverflow.ellipsis,
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: CeloeTheme.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: CeloeTheme.primaryColor,
            tabs: [
              Tab(text: 'Materi'),
              Tab(text: 'Tugas Dan Kuis'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Materi Tab
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Download Materi Offline',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ...materials.map((m) => MaterialItemCard(material: m)).toList(),
                  const SizedBox(height: 10),
                  // Note Card
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Catatan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Fitur offline ini masih berupa layout. Integrasi penyimpanan (misalnya path_provider) dan download manager bisa ditambahkan berikutnya.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Tugas Dan Kuis Tab
             ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                return AssignmentItemCard(assignment: assignments[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
