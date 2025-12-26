import 'package:flutter/material.dart';
import 'package:appceloe/models/course_material.dart';
import 'package:appceloe/utils/theme.dart';

class MaterialItemCard extends StatelessWidget {
  final CourseMaterial material;

  const MaterialItemCard({super.key, required this.material});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;

    if (material.type == CourseMaterialType.pdf) {
      iconData = Icons.picture_as_pdf;
      iconColor = Colors.red;
    } else if (material.type == CourseMaterialType.video) {
      iconData = Icons.play_circle_fill;
      iconColor = Colors.red;
    } else {
      // CourseMaterialType.ppt or others
      iconData = Icons.slideshow;
      iconColor = Colors.red;
    }

    return Container(
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
        children: [
          Icon(iconData, color: iconColor, size: 30),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  material.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${material.typeDisplay} • ${material.size}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: const [
              Icon(Icons.download, color: CeloeTheme.primaryColor, size: 20),
              SizedBox(width: 5),
              Text(
                'Unduh',
                style: TextStyle(
                  color: CeloeTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
