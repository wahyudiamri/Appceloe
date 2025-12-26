import 'package:flutter/material.dart';
import 'package:appceloe/models/course.dart';
import 'package:appceloe/utils/theme.dart';
import 'package:appceloe/screens/course_detail_screen.dart';

class CourseProgressItem extends StatelessWidget {
  final Course course;

  const CourseProgressItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailScreen(course: course),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           // Course Image
           Container(
             width: 50,
             height: 50,
             margin: const EdgeInsets.only(right: 15),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(8),
               image: DecorationImage(
                 image: AssetImage(course.imagePath),
                 fit: BoxFit.cover,
               ),
             ),
           ),
           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded( // Prevent overflow if name is long
                      child: Text(
                        course.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${(course.progress * 100).toInt()}%',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: course.progress,
                  backgroundColor: Colors.grey[200],
                  color: CeloeTheme.primaryColor,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
           ),
        ],
      ),
     ),
    );
  }
}
