import 'dart:io';
import 'package:flutter/material.dart';

class RecentItem extends StatelessWidget {
  final String image;
  final String title;
  final String confidence;
  final String time;

  const RecentItem({
    super.key,
    required this.image,
    required this.title,
    required this.confidence,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              File(image),
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),


          const SizedBox(width: 14),

          /// TEXTS (IMPORTANT FIX 🔥)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  'Confidence: $confidence',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey),
                ),

                Text(
                  time,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          /// CHECK ICON
          const Icon(
            Icons.check_circle,
            color: Color(0xFF4CAF50),
            size: 26,
          ),
        ],
      ),
    );
  }
}
