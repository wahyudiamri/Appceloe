enum CourseMaterialType { pdf, video, ppt }

class CourseMaterial {
  final String title;
  final String typeDisplay; // e.g. "PDF", "Video", "PPT"
  final String size;
  final CourseMaterialType type;

  CourseMaterial({
    required this.title,
    required this.typeDisplay,
    required this.size,
    required this.type,
  });
}
