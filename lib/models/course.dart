class Course {
  final String name;
  final double progress; // 0.0 to 1.0

  Course({required this.name, required this.progress});
}

class Assignment {
  final String title;
  final String courseName;
  final String deadline;

  Assignment({
    required this.title,
    required this.courseName,
    required this.deadline,
  });
}
