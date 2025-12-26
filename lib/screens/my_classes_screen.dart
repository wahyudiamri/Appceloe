import 'package:flutter/material.dart';
import 'package:appceloe/models/course.dart';
import 'package:appceloe/widgets/class_item_card.dart';

class MyClassesScreen extends StatelessWidget {
  final List<Course> courses;

  const MyClassesScreen({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return ClassItemCard(course: courses[index]);
      },
    );
  }
}
