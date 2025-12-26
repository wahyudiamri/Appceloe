import 'package:flutter/material.dart';

class AnnouncementBanner extends StatelessWidget {
  final String title;

  const AnnouncementBanner({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[50], // Light orange background for alert/info
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.orange.withOpacity(0.5)),
      ),
      child: Row(
        children: [
           const Icon(Icons.info_outline, color: Colors.orange),
           const SizedBox(width: 15),
           Expanded(
             child: Text(
               title,
               style: const TextStyle(
                 color: Colors.orange, // Slightly darker orange for text
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
        ],
      ),
    );
  }
}
