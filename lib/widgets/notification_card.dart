import 'package:flutter/material.dart';
import 'package:appceloe/models/notification_item.dart';
import 'package:appceloe/utils/theme.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
           // Bell Icon
           const Padding(
             padding: EdgeInsets.only(top: 2.0),
             child: Icon(
               Icons.notifications,
               color: CeloeTheme.primaryColor,
               size: 28,
             ),
           ),
           const SizedBox(width: 15),
           // Text Content
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   notification.title,
                   style: const TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 14,
                     color: Colors.black,
                   ),
                 ),
                 const SizedBox(height: 5),
                 Text(
                   notification.message,
                   style: TextStyle(
                     fontSize: 13,
                     color: Colors.grey[700],
                   ),
                 ),
               ],
             ),
           ),
        ],
      ),
    );
  }
}
