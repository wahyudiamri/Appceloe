import 'package:flutter/material.dart';
import 'package:appceloe/models/course_assignment.dart';
import 'package:appceloe/utils/theme.dart';
import 'package:appceloe/screens/assignment_detail_screen.dart';

class AssignmentItemCard extends StatelessWidget {
  final CourseAssignment assignment;

  const AssignmentItemCard({super.key, required this.assignment});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;
    String statusText;
    Color statusColor;

    if (assignment.type == AssignmentType.quiz) {
      iconData = Icons.quiz;
      iconColor = Colors.orange;
    } else {
      iconData = Icons.assignment;
      iconColor = CeloeTheme.primaryColor;
    }

    if (assignment.status == AssignmentStatus.open) {
      statusText = 'Terbuka';
      statusColor = Colors.green;
    } else if (assignment.status == AssignmentStatus.submitted) {
      statusText = 'Diserahkan';
      statusColor = Colors.blue;
    } else if (assignment.status == AssignmentStatus.graded) {
      statusText = 'Dinilai';
      statusColor = Colors.purple;
    } else {
      statusText = 'Terlewat';
      statusColor = Colors.red;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssignmentDetailScreen(assignment: assignment),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: iconColor, size: 24),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    assignment.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    assignment.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        assignment.deadline,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                statusText,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
