import 'package:flutter/material.dart';
import 'package:appceloe/models/course_assignment.dart';
import 'package:appceloe/utils/theme.dart';
import 'package:appceloe/screens/quiz_screen.dart';

class AssignmentDetailScreen extends StatelessWidget {
  final CourseAssignment assignment;

  const AssignmentDetailScreen({super.key, required this.assignment});

  @override
  Widget build(BuildContext context) {
    String buttonText;
    if (assignment.type == AssignmentType.quiz) {
      buttonText = 'Mulai Kuis';
    } else {
      buttonText = 'Kumpulkan Tugas';
    }

    // Logic for button enabled state based on status can be added here
    bool isEnabled = assignment.status == AssignmentStatus.open;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          assignment.type == AssignmentType.quiz ? 'Detail Kuis' : 'Detail Tugas',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              assignment.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 5),
                Text(
                  'Batas Waktu: ${assignment.deadline}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              'Deskripsi:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              assignment.description,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isEnabled ? () {
                  if (assignment.type == AssignmentType.quiz) {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizScreen()),
                    );
                  } else {
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Aksi ${buttonText} berhasil!')),
                    );
                  }
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: CeloeTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBackgroundColor: Colors.grey,
                ),
                child: Text(
                  isEnabled ? buttonText : 'Tutup/Selesai',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Explicitly set text color to white for better contrast
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
