enum AssignmentType { assignment, quiz }
enum AssignmentStatus { open, submitted, overdue, graded }

class CourseAssignment {
  final String title;
  final String description;
  final String deadline; // Display string for simplicity e.g. "Tomorrow, 11:59 PM"
  final AssignmentType type;
  final AssignmentStatus status;

  CourseAssignment({
    required this.title,
    required this.description,
    required this.deadline,
    required this.type,
    required this.status,
  });
}
