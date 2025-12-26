class Course {
  final String name;
  final String code; // e.g. D4SM-41-GABI
  final String semester; // e.g. 2021/2
  final String lecturers; // e.g. [ARS]
  final double progress; // 0.0 to 1.0

  Course({
    required this.name,
    required this.code,
    required this.semester,
    required this.lecturers,
    required this.progress,
  });
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
